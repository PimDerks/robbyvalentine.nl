---
title: Page title
---

﻿{% extends '../_layouts/prototype/default.swig' %}

{% block title %}
    {{ data.fm.title }}
{% endblock title %}

{% block content %}

    <p>page content</p>

{% endblock %}
