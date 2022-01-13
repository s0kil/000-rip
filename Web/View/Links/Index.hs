module Web.View.Links.Index where
import Web.View.Prelude

data IndexView = IndexView { links :: [Link]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>My Links <a href={pathTo NewLinkAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Slug</th>
                        <th>Target</th>
                        <th>Short Link</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach links renderLink}</tbody>
            </table>

        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Links" LinksAction
                ]

renderLink :: Link -> Html
renderLink link = [hsx|
    <tr>
        <td>{get #slug link}</td>
        <td><a href={get #target link} target="_blank" rel="noopener noreferrer">{get #target link}</a></td>
        <td><a href={shortLink} target="_blank" rel="noopener noreferrer" class="text">{shortName}</a></td>
        <td><button class="btn btn-primary btn-sm" data-clipboard-text={shortLink}>Copy to clipboard</button></td>
        <td><a href={DeleteLinkAction (get #id link)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
    where
        shortName = "000.rip/" <> get #slug link
        shortLink = "https://000.rip/" <> get #slug link
