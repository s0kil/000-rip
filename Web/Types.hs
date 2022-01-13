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
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)

data LinksController
    = LinksAction
    | NewLinkAction
    | ShowLinkAction { linkId :: !(Id Link) }
    | CreateLinkAction
    | EditLinkAction { linkId :: !(Id Link) }
    | UpdateLinkAction { linkId :: !(Id Link) }
    | DeleteLinkAction { linkId :: !(Id Link) }
    deriving (Eq, Show, Data)


data ShortlinksController
    = ShortlinkAction { slug :: !(Text) }
    deriving (Eq, Show, Data)
