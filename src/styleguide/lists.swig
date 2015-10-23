---
title: Lists
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Lists' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    <h2>Unordered list</h2>
    <ul>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>
            Proin congue justo et felis tempus hendrerit.
            <ul>
                <li>Proin congue justo et felis tempus hendrerit.</li>
                <li>Proin congue justo et felis tempus hendrerit.</li>
                <li>Proin congue justo et felis tempus hendrerit.</li>
                <li>Proin congue justo et felis tempus hendrerit.</li>
            </ul>
        </li>
        <li>Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin congue justo et felis tempus hendrerit. Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
    </ul>

    <h2>Ordered list</h2>
    <ol>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Proin congue justo et felis tempus hendrerit.</li>
        <li>Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin congue justo et felis tempus hendrerit. Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Proin congue justo et felis tempus hendrerit.</li>
        <li>Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin congue justo et felis tempus hendrerit. Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Proin congue justo et felis tempus hendrerit.</li>
        <li>Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin congue justo et felis tempus hendrerit. Pellentesque eget lobortis dui. Etiam nec rutrum augue, vitae tincidunt lectus.</li>
    </ol>

    <h2>Definition list</h2>
    <dl>
        <dt>Cascading Style Sheets</dt>
        <dd>Style sheets are used to provide presentational suggestions. Documents structured using XML or HTML are able to make use of them.</dd>
        <dt>Content Management System</dt>
        <dd>A content management system (CMS) is a system used to manage the content of a Web site. Typically, a CMS consists of two elements: the content management application (CMA) and the content delivery application (CDA)</dd>
    </dl>

{% endblock %}

