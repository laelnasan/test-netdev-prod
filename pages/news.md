---
layout: default
title: News
main_nav: true
pagination: true  
enabled: true
order: 2
---

  <h1 class="page-title">
    <a class="no-link-style" href="{{ page.url | prepend: site.baseurl }}">News</a>
  </h1>
  <div class="posts-list">
  {% for post in site.posts %}
      <h2>
        <a class="no-link-style" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>
        <p class="date"> {{ post.date | date: '%a, %d, %b. %Y' }}</p>
        <section class="post-excerpt" itemprop="description">
          {{ post.content }}
        </section>
  {% if forloop.last == false %}<hr>{% endif %}
  {% endfor %}
  </div>
<br>
