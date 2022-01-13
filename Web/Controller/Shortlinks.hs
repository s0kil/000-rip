module Web.Controller.Shortlinks where

import Web.Controller.Prelude

instance Controller ShortlinksController where
    action ShortlinkAction { slug } = do
        maybeLink <- query @Link |> filterWhere(#slug, slug) |> fetchOneOrNothing
        case maybeLink of
            Just link -> do
                redirectToUrl (get #target link)
            Nothing -> do
                renderNotFound
