{% include "../shared/document-open.swig" %}

    <head>

        {% include "../shared/document-head.swig" %}

        <title>
            {% block title %}Page Title{% endblock %} - Styleguide
        </title>

        {% include "sublayouts/document-head-includes.swig" %}

    </head>
    <body class="styleguide styleguide-index">

        {% block content %}
            <p>This comes from the default layout.</p>
        {% endblock %}

        {% include "sublayouts/document-scripts.swig" %}

{% include "../shared/document-foot.swig" %}