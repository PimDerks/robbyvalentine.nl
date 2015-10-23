---
title: Lay-out
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Lay-out' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    {% set sizes = ['one-whole', 'three-fourth', 'two-third', 'one-half', 'one-third', 'one-fourth'] %}
    {% for size in sizes %}
        <div class="grid">
            <div class="grid__item grid__item--{{ size }}">
                <div class="grid-placeholder">{{ size }}</div>
            </div>
        </div>
    {% endfor %}

    <p>Use the grid--center class to center the grid.</p>
    {% for size in sizes %}
        <div class="grid grid--center">
            <div class="grid__item grid__item--{{ size }}">
                <div class="grid-placeholder">{{ size }}</div>
            </div>
        </div>
    {% endfor %}

    <p>Use the grid--rev class to reverse the visual order of the columns</p>
    <div class="grid grid--rev">
        {% for i in Array(4) %}<div class="grid__item grid__item--one-fourth">
                <div class="grid-placeholder">
                    <p>{{ loop.index }}</p>
                </div>
            </div>{% endfor %}
    </div>


    <p>Use the grid--flex class to create equal height columns</p>
    <div class="grid grid--flex">
        {% for i in Array(4) %}
        <div class="grid__item grid__item--one-fourth">
            <div class="grid-placeholder">
                {% for j in Array(loop.index) %}
                    <p>{{ loop.index }}</p>
                {% endfor %}
            </div>
        </div>
        {% endfor %}
    </div>

    {% set sizes = ['one-fourth', 'one-half', 'one-third'] %}
    <p>Use the --pull and --push modifier classes to offset columns</p>
    {% for size in sizes %}
        <div class="grid">
            <div class="grid__item grid__item--{{ size }} grid__item--push-{{ size }}">
                <div class="grid-placeholder">{{ size }}</div>
            </div>
        </div>
    {% endfor %}

{% endblock %}

