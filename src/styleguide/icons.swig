---
title: Icons
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Icons' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    {% set icons = ['agm', 'close', 'companies', 'contentmanager', 'countries', 'dashboard', 'delete', 'document', 'documents', 'edit', 'flag-de', 'flag-es', 'flag-fr', 'flag-gb', 'flag-nl', 'indices', 'logout', 'settings', 'upload', 'users'] %}
    {% for icon in icons %}
        <p>
            <svg class="c-icon">
                <use xlink:href="#{{ icon }}"/>
            </svg>
        </p>
    {% endfor %}

{% endblock %}

