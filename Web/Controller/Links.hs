module Web.Controller.Links where

import Web.Controller.Prelude
import Web.View.Links.Index
import Web.View.Links.New
import Web.View.Links.Edit
import Web.View.Links.Show

instance Controller LinksController where
    beforeAction = do
        ensureIsUser

    action LinksAction = do
        links <-
            query @Link
                |> filterWhere (#userId, get #id currentUser)
                |> fetch
        render IndexView { .. }

    action NewLinkAction = do
        let link = newRecord
        render NewView { .. }

    -- action ShowLinkAction { linkId } = do
    --     link <- fetch linkId
    --     render ShowView { .. }

    -- action EditLinkAction { linkId } = do
    --     link <- fetch linkId
    --     render EditView { .. }

    -- action UpdateLinkAction { linkId } = do
    --     link <- fetch linkId
    --     link
    --         |> buildLink
    --         |> ifValid \case
    --             Left link -> render EditView { .. }
    --             Right link -> do
    --                 link <- link |> updateRecord
    --                 setSuccessMessage "Link updated"
    --                 redirectTo EditLinkAction { .. }

    action CreateLinkAction = do
        let link = newRecord @Link
        link
            |> buildLink
            |> validateIsUnique #slug
            >>= ifValid \case
                Left link -> render NewView { .. }
                Right link -> do
                    link <- link |> createRecord
                    setSuccessMessage "Link created"
                    redirectTo LinksAction

    action DeleteLinkAction { linkId } = do
        link <- fetch linkId
        case (linkBelongsToUser link) of
            True -> do
                deleteRecord link
                setSuccessMessage "Link deleted"
                redirectTo LinksAction
            False -> do
                setSuccessMessage "You rascal"
                redirectTo LinksAction

buildLink link = link
    |> fill @["target","slug"]
    |> set #userId (get #id currentUser)

linkBelongsToUser link = (get #userId link) == (get #id currentUser)
