module Web.Controller.Users where

import Web.Controller.Prelude
import Web.View.Users.New

instance Controller UsersController where
    action NewUserAction = do
        let user = newRecord
        render NewView { .. }

    action CreateUserAction = do
        let user = newRecord @User
        user
            |> buildUser
            |> validateField #email isEmail
            |> validateField #passwordHash nonEmpty
            |> validateIsUnique #email
            >>= ifValid \case
                Left user -> render NewView { .. }
                Right user -> do
                    hashed <- hashPassword (get #passwordHash user)
                    user <- user
                        |> set #passwordHash hashed
                        |> createRecord
                    setSuccessMessage "You have successfully registered"
                    login user
                    redirectToPath $ pathTo LinksAction

buildUser user = user
    |> fill @["email","passwordHash","failedLoginAttempts"]
