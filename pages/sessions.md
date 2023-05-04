---
layout: default
title: Sessions
main_nav: true
enabled: true
order: 6
---
<h1 class="page-title">
  <a class="no-link-style" href="{{ page.url | prepend: site.baseurl }}">
    Sessions
  </a>
</h1>

<div id="session-nav" style="margin-bottom: 1em">
  {% assign categories = site.descriptions | where: "desc", "session type" | map: "cat" %}

  {% for cat in categories %}
  <ul class="navi">
    <li><a href="#{{ cat }}">{{ cat | capitalize }}</a></li>
  </ul>
  {% endfor %}

</div>
<br />

{% for cat in categories %}
<h2 id="{{ cat }}" class="topic-title for-onclick" onclick="$('#{{ cat }}-sessions').toggle()">
  {{ cat | capitalize}}(s)
</h2>
<div id="{{ cat }}-sessions" style="display: true;">

  {% if site.categories[cat] %}
  {% assign posts = site.categories[cat] | sort:"pid" %}
  {% for post in posts %}

  <div class="session-article">
    <h3 class="session-title">
      <a class="session-link" href="{{ post.url | prepend: site.baseurl }}">
        {{ post.title }}
      </a>
    </h3>

    <p class="speaker">
      {% if cat == "tutorial" %}
      {% assign title = "Instructor" %}
      {% elsif cat == "workshop" %}
      {% assign title = "Chair" %}
      {% else %}
      {% assign title = "Speaker" %}
      {% endif %}

      {% for author in post.authors %}
      {% if forloop.first %}
      {% if forloop.last %}
      {% assign plural = ":" %}
      {% else %}
      {% assign plural = "s:" %}
      {% endif %}
      {{ plural | prepend: title }}
      {% endif %}

      {% if forloop.first == false %} and {% endif %}{{ author }}
      {% endfor %}
    </p>
  </div>

  {% endfor %}
  {% else %}
  TBD
  {% endif %}

</div>
{% endfor %}