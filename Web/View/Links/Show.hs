module Web.View.Links.Show where
import Web.View.Prelude

data ShowView = ShowView { link :: Link }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Link</h1>
        <p>{link}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Links" LinksAction
                            , breadcrumbText "Show Link"
                            ]