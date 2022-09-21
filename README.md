# Netdev 0x16 Jekyll Theme

A port of the current layout of [netdevconf.info/0x16](www.netdevconf.info/0x16) to Jekyll.

Built upon the [Centrarium theme](https://github.com/bencentra/centrarium).

## Installation

Just [download this
project](https://github.com/expertisesolutions/jekyll-sample-netdev.github.io)
and add all the files to your project. Add **news** to the `news/_posts/`
directory, and **sessions** to `sessions/<type>/_drafts`. Create your pages
with the proper Jekyll front matter (see [posts](#posts) bellow for an
example).

Don't forget to install Jekyll and other dependencies:
```bash
# cd into project directory
cd netdevconf
# install Bundler if you don't have it already
gem install bundler
# install jekyll
bundle install
```

### Posts

The netdevconf site presents two types of post: [news](#news) and
[sessions](#sessions). The former follows the idea of a blog post, with a
defined date and title. The latter, however, does not benefit from date
information and may be listed in order of creation, being closer to the
concept of a *draft* in Jekyll.

#### news

To add a news post, simply add a file in the `news/_posts` directory following the
convention `YYYY-MM-DD-name-of-news.md` and include the necessary front matter.
Take a look at the source examples to get an idea about how it works.

```Markdown
---
title: Post Sample
---

{% comment %}
  # news/_posts/2022-09-20-post-example.md
  This block is a comment and will not be rendered in the final page.
{% endcomment %}

Your news content goes here

```

#### sessions

Sessions may be created as drafts. Just create a file in
`sessions/<type>/_drafts` where `<type>` is the session type (singular
lowercase).

```Markdown

---
title: The session title
label: The session label
authors:
  - Author 1
  - Author 2
  - Author 3
contents:
  - type: video | paper | report | slides
    href: url1
  - type: video | paper | report | slides
    href: url2
---

{% comment %}
  # session/type/_drafts/name-of-your-file.md
{% endcomment %}

The description goes here.

```

<!-- Drafts are posts without date information (hence no file name convention) that -->
<!-- are not supposed to be in a production build by default. Therefore, the option -->
<!-- `--drafts` must be passed in order to Jekyll to render properly. -->

<!-- ```bash -->
<!-- # run jekyll server for local preview -->
<!-- bundle exec jekyll serve --drafts -->

<!-- # or build the site -->
<!-- bundle exec jekyll build --drafts -->

<!-- ``` -->

####  Categories

You can, alternatively, place your files in a `_posts` or `_drafts` folder in
the root directory of the project. In that case, the front matter of each file
must define the categories accordingly:

```yml
# news:
category: news

# sessions
categories: sessions <type>
```

Not doing so will lead to Jekyll not rendering your content.

### Important Variables

Here are the important variables from `_sass/base/_variables.scss` you can
tweak to customize the theme to your liking:

* `$base-font-family`: The font-family of the body text. Make sure to `@import`
  any new fonts!
* `$heading-font-family`: The font-family of the headers. Make sure to
  `@import` any new fonts!
* `$base-font-size`: The base font-size. Defaults to $em-base from Bourbon
  (`bourbon/settings/_px-to-em.scss`).
* `$base-font-color`: The color for the body text.
* `$action-color`: The color for links in the body text.
* `$highlight-color`: The color for the footer and page headers (when no cover
  image provided).

## Configuration

Most configuration options can be found in `_config.yml`.

### Site Settings

* __title:__ The title for the site. Displayed in the navigation menu, the
  `index.html` header, and the footer.
* __subtitle:__ The subtitle of the site. Displayed in the `index.html` header.
* __description:__ The description of the site. Used for search engine results
  and displayed in the footer.
* __baseurl:__ The subpath of the site (e.g. /blog/).
* __url:__ The base hostname and protocol for the site.
* __cover:__ The relative path to the site's cover image.
<!--
* __logo:__ The
  relative path to the site's logo. Used in the navigation menu instead of the
  title if provided. -->

### Build Settings

* __markdown:__ Markdown parsing engine. Default is kramdown.

### Syntax Highlighting Settings

Inside of a post, you can enable syntax highlighting with the `{% highlight
<language> %}` Liquid tag. For example:

```
{% highlight javascript %}
function demo(string, times) {
  for (var i = 0; i < times; i++) {
    console.log(string);
  }
}
demo("hello, world!", 10);
{% endhighlight %}
```

You can change the [HighlightJS theme][highlightjs_theme] in `_config.yml`:

```yml
highlightjs_theme: "monokai_sublime"
```

### Category Descriptions

Session types are identified as a second category to `sessions`. They should be
defined alongside the **news** and **sessions** categories with `desc: "session
type"`. Session files tagged with a type not correctly defined in descriptions
**will not** be displayed at the **Sessions** page.

```yml
# Category descriptions
descriptions:
  - cat: news
    desc: "Netdev News"

  - cat: sessions
    desc: "NetdevConf Sessions"

  # Session types
  - cat: talk
    desc: "session type"

  - cat: tutorial
    desc: "session type"

  - cat: workshop
    desc: "session type"
```

### Sponsors

Sponsors are described in the `sponsors` list. The grouping is not strictly
necessary, i.e. you can add definitions in any given order, but be aware that Jekyll
will try to group sponsors in the order of definition. If you define a silver
sponsor before any gold one the resulting page will show silver sponsors before
gold sponsors.

```yml
sponsors:
  - type: platinum | gold | silver | bronze | media
    url: Sponsor's site URL
    img: The logo location relative to assets/sponsors/ folder
    alt: The logo alt
```

### Custom Page-Specific Javascript

You can add page-specific javascript files by adding them to the top-level
`/js` directory and including the filename in the __custom_js__ page's
configuration file:

```yml
# Custom js (for individual pages)
---
layout: post
title:  "Dummy Post"
date:   2015-04-18 08:43:59
author: Ben Centra
categories: Dummy
custom_js:
- Popmotion
- Vue
---
```

The `/js/` directory would contain the corresponding files:

```bash
$ ls js/
Popmotion.js Vue.js
```

## License

MIT. See [LICENSE.MD](https://github.com/bencentra/centrarium/blob/master/LICENSE.md).

[bencentra]: http://bencentra.com
[bourbon]: http://bourbon.io/
[neat]: http://neat.bourbon.io/
[bitters]: http://bitters.bourbon.io/
[refills]: http://refills.bourbon.io/
[fontawesome]: http://fortawesome.github.io/Font-Awesome/
[highlightjs]: https://highlightjs.org/
[highlightjs_theme]: https://highlightjs.org/static/demo/
[lightbox]: http://lokeshdhakar.com/projects/lightbox2/
[cover]: https://www.flickr.com/photos/79666107@N00/3796678503/in/photolist-6MuYfc-61Rtft-8XzPmY-a6Cozm-54eSMs-6oMJmk-aepZQq-9YkPHp-fiAEGE-dVP4Z5-oxPyJP-atKUFJ-9YHWA5-9YF2f2-9YF2gR-9YHVGN-9YHVvs-qZYYQ6-4JqP2i-a2peGy-9YHVUm-9YHVF7-9YHVCL-9YF3NK-cYteMo-aiPmb9-69dtAi-9YF21x-4aWpmn-7SLiUL-77pqVX-8vXbYv-4HGDSH-a2h5P1-8LsZrQ-9aj1ez-auPZ7q-9YHVMd-9YF2bi-9YF23D-8LpWpn-9an6KL-9YHVZL-dqZ3Cz-2GuvnX-9YHWUo-9YHVWd-p5Roh5-i1zTbv-6sYrUT
[disqus]: https://disqus.com/
[ga]: http://www.google.com/analytics/
[archives]: https://github.com/jekyll/jekyll-archives
[sitemap]: https://github.com/jekyll/jekyll-sitemap
