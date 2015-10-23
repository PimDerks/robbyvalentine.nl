---
title: Colors
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Colors' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

<ul class="styleguide-colors bare-list">
    {% for i in Array(25) %}
        <li>
            <div class="styleguide-colors__color"></div>
        </li>
    {% endfor %}
</ul>

{% endblock %}

