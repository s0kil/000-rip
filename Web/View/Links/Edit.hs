module Web.View.Links.Edit where
import Web.View.Prelude

data EditView = EditView { link :: Link }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Link</h1>
        {renderForm link}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Links" LinksAction
                , breadcrumbText "Edit Link"
                ]

renderForm :: Link -> Html
renderForm link = formFor link [hsx|
    {(textField #userId)}
    {(textField #slug)}
    {(textField #target)}
    {submitButton}

|]
