module Web.View.Links.New where

import Web.View.Prelude

data NewView = NewView { link :: Link }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <div class="h-100" id="sessions-new">
            <div class="d-flex align-items-center">
                <div class="w-100">
                    <div style="max-width: 400px" class="mx-auto mb-5">
                        <h5>New Link</h5>
                        {renderForm link}
                    </div>
                </div>
            </div>
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Links" LinksAction
                , breadcrumbText "New Link"
                ]

renderForm :: Link -> Html
renderForm link = formFor link [hsx|
    {(textField #slug) { fieldLabel = "Slug (Shortname)", placeholder = "(Optional) Darth Vader will decide" }}
    {(textField #target) { fieldLabel = "Target (Where do you want short link to go?)", placeholder = "https://example.com/" }}

    {submitButton}
|]
