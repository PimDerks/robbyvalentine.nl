{% include "../shared/document-open.swig" %}

    <head>

        {% include "../shared/document-head.swig" %}

        <title>
            {% block title %}
                {{ data.fm.title }}
            {% endblock %} - {{ data.settings.project }}
        </title>

        {% include "sublayouts/document-head-includes.swig" %}
        {% include "sublayouts/document-head-og-data.swig" %}

    </head>
    <body>

        {% include "sublayouts/document-scripts.swig" %}

{% include "../shared/document-foot.swig" %}