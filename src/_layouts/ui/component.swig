{% include "../shared/document-open.swig" %}

<head>

        {% include "../shared/document-head.swig" %}

        <title>
                {% block title %}
                        {{ fm.title }}
                {% endblock %} - Components Library
        </title>

        {% include "sublayouts/document-head-includes.swig" %}

</head>
<body>

{% block content %}

        <h1>{{ fm.title }}</h1>

        {# Render base #}

        {% for sub in component.sub %}
                {% if sub.name === component.name %}

                        {% set config = { data: sub, heading: 2 } %}
                        {% include "sublayouts/component.swig" with config %}

                {% endif %}
        {% endfor %}

        {# Render variants #}

        {% if component.sub.length > 1 %}
                <section id="component-{{ component.name }}-variants">
                        <h2>Variants of this component</h2>
                        {% for sub in component.sub %}
                                {% if sub.name !== component.name %}
                                        <h3>{{ sub.name }}</h3>
                                        {% set config = { data: sub, heading: 4 } %}
                                        {% include "sublayouts/component.swig" with config %}
                                {% endif %}
                        {% endfor %}
                </section>
        {% endif %}

{% endblock %}

{% include "sublayouts/document-scripts.swig" %}

{% include "../shared/document-foot.swig" %}