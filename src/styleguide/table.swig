---
title: Table
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Table' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    <table>
        <thead>
            <tr>
                <th scope="col">Kolom A</th>
                <th scope="col">Kolom B</th>
                <th scope="col">Kolom C</th>
            </tr>
        </thead>
        <tbody>
            {% for i in Array(10) %}
                <tr>
                    <th scope="row">Rij {{ loop.index }}</th>
                    <td>Lorem Ipsum</td>
                    <td>Dolor Sit</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>

{% endblock %}