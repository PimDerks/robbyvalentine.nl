---
title: Buttons
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Buttons' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    <p><button type="button">Button</button></p>
    <p><input type="submit" value="Input" class="button"/></p>
    <p><a href="#" class="button">Anchor</a></p>

{% endblock %}