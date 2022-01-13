module Web.View.Links.New where

import Web.View.Prelude

data NewView = NewView { link :: Link }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Link</h1>
        {renderForm link}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Links" LinksAction
                , breadcrumbText "New Link"
                ]

renderForm :: Link -> Html
renderForm link = formFor link [hsx|
    {(textField #slug) { fieldLabel = "Slug (Shortname)" }}
    {(textField #target) { fieldLabel = "Target (Where do you want short link to go?)" }}

    {submitButton}
|]
