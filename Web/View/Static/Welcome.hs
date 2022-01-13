module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <div class="container-fluid">
            <p>Link Sharing Service (URL Shortener)</p>
        </div>

        <div class="footer fixed-bottom m-2">
            <a class="float-right" href="https://github.com/s0kil/000-rip">Source Code</a>
        </div>
|]
