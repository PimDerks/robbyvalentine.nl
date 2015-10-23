---
title: Article Body
---

<!-- Data parsed in should be in the ArticleBody variable. If not available, use the default data in the ArticleBody.json file -->
{% if !ArticleBody %}
    {% set ArticleBody = data.ArticleBody %}
{% endif %}

<!-- Article body -->
<section property="articleBody">
    {% for block in ArticleBody %}

        {% if block.title %}
            <h2 id="{{ block.title|lower|replace(' ', '-', 'g') }}">{{ block.title }}</h2>
        {% endif %}

        {% autoescape false %}
        {{ block.body }}
        {% endautoescape %}

    {% endfor %}
</section>
<!-- /Article body -->