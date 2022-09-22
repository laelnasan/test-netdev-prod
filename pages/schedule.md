---
layout: default
title: Schedule
pagination:
main_nav: true
enabled: true
order: 7
---

# Test Schedule Page

{% for slot in site.data.schedule %}
{% if slot.decision == "Accepted and Anounced" %}

## {{ slot.title }}
  {% assign title = "Speaker" %}

  {% for author in slot.authors %}
  {% if forloop.first %}
  {% if forloop.last %}
  {% assign plural = ":" %}
  {% else %}
  {% assign plural = "s:" %}
  {% endif %}
  {{ plural | prepend: title }}
  {% endif %}

  {% if forloop.first == false %} and {% endif %}{{ author.first }} {{ author.last }}
  {% endfor %}

### Type
{{ slot.options.submission-type }}

### Label
{{ slot.options.submission-label }}

### Description
{{ slot.abstract }}

{% if forloop.last == false %}---{% endif %}
{% endif %}
{% endfor %}

{% comment %}
Check back later for the conference schedule.
<br><br>

# Schedule

Times below are listed in UTC. If you add this to your own Google Calendar using the button at the bottom of this page, you'll be able to view the schedule in your preferred timezone.  
  
Note that when viewing the schedule on the [virtual conference platform](virtual.html) the timezone will be different, so please be aware of that and make sure you notice which timezone is displayed.

Check back later for the conference schedule.  
  

### More info on how to connect: [https://netdevconf.info/0x16/virtual.html](virtual.html)  
  
All times shown are in GMT.

  

## Old Schedule

default view [View the Netdev 0x16 Conference schedule &
directory.](//netdev0x16.sched.com/) expanded [View the Netdev 0x16 Conference
schedule & directory.](//netdev0x16.sched.com/list/descriptions/) grid [View
the Netdev 0x16 Conference schedule & directory.](//netdev0x16.sched.com/grid/)
by venue [View the Netdev 0x16 Conference schedule &
directory.](//netdev0x16.sched.com/venues/) speakers [View the Netdev 0x16
Conference schedule & directory.](//netdev0x16.sched.com/directory/speakers)
sponsors [View the Netdev 0x16 Conference schedule &
directory.](//netdev0x16.sched.com/directory/sponsors)
{% endcomment %}
