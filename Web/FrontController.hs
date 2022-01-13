module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)
import IHP.LoginSupport.Middleware

-- Controller Imports
import Web.Controller.Links
import Web.Controller.Users
import Web.Controller.Static
import Web.Controller.Sessions
import Web.Controller.Shortlinks

instance FrontController WebApplication where
    controllers =
        [ startPage WelcomeAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @LinksController
        , parseRoute @UsersController
        , parseRoute @ShortlinksController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
