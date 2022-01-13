module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

data WebApplication = WebApplication deriving (Eq, Show)

data StaticController = WelcomeAction deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

data UsersController
    = NewUserAction
    | CreateUserAction
    deriving (Eq, Show, Data)

data LinksController
    = LinksAction
    | NewLinkAction
    | CreateLinkAction
    | DeleteLinkAction { linkId :: !(Id Link) }
    deriving (Eq, Show, Data)


data ShortlinksController
    = ShortlinkAction { slug :: !(Text) }
    deriving (Eq, Show, Data)
