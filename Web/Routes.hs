module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute StaticController
instance AutoRoute SessionsController
instance AutoRoute UsersController
instance AutoRoute LinksController

instance HasPath ShortlinksController where
    pathTo ShortlinkAction { slug } = "/" <> slug

instance CanRoute ShortlinksController where
    parseRoute' = do
        onlyAllowMethods [GET]
        string "/"
        slug  <- remainingText
        pure ShortlinkAction { slug }
