# devgenii.com.ua — Agent Instructions

Profile/landing page site for devgenii.com.ua. Single-page Sinatra app, Ruby 3.4.8.

## Development

Start the dev server:
```
bin/dev
# or: bundle exec rackup config.ru
```
App is served at `http://localhost:9292`. Assets are served from `/assets` via Sprockets.

## Architecture

| Layer | Details |
|---|---|
| Entry point | `app.rb` — single `GET /` route, renders `views/index.erb` |
| Rack config | `config.ru` — mounts Sprockets at `/assets`, registers `sinatra-partial` |
| Layout | `views/layout.erb` — Bootstrap 3, Font Awesome, wow.js, owl.carousel, jQuery sticky nav |
| Page sections | `views/index.erb` composes ERB partials |
| Partials | `views/_intro.erb`, `_feature.erb`, `_feature_2.erb`, `_subscrube.erb`, `_screenshots.erb`, `_clients.erb`, `_testimonial.erb`, `_download.erb` |
| Assets | `assets/stylesheets/`, `assets/javascripts/`, `assets/images/`, `assets/fonts/` — compiled by Sprockets |

## Key Conventions

- **Partials**: rendered with `<%= partial :_name %>` (sinatra-partial gem, ERB engine).
- **CSS**: `assets/stylesheets/app.css` is the Sprockets manifest. Add new styles to `assets/stylesheets/css-app.css` or create new files and require them in `app.css`.
- **JS**: `assets/javascripts/app.js` is the Sprockets manifest. Vendor scripts live alongside it.
- **No test suite** — verify changes by running the server and inspecting the page.

## Deployment

Kamal is used for deployment. Deploy with:
```
kamal deploy
```
