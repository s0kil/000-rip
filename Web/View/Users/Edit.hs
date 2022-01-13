module Web.View.Users.Edit where

import Web.View.Prelude

data EditView = EditView { user :: User }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit User</h1>
        {renderForm user}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Users" UsersAction
                , breadcrumbText "Edit User"
                ]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(textField #email)}
    {(textField #passwordHash) { fieldLabel = "Password" }}

    {submitButton}
|]
