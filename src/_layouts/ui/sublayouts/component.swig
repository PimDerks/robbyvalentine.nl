{% set heading = 'h' + config.heading %}
{% set subheadingLevel = config.heading + 1 %}
{% set subheading = 'h' + subheadingLevel %}
{% set subsubheadingLevel = config.heading + 2 %}
{% set subsubheading = 'h' + subsubheadingLevel %}

{# Location of this component in the project. #}
<section id="component-{{ data.name }}-location">
    <{{ heading }}>Location</{{ heading }}>
    <dl class="hierarchy">
        <dt>Module</dt>
        <dd>{{ config.data.hierarchy.module }}</dd>
        <dt>Component</dt>
        <dd>{{ config.data.hierarchy.component }}</dd>
        {% if config.data.hierarchy.subcomponent !== config.data.hierarchy.component && config.data.hierarchy.subcomponent %}
        <dt>Submodule</dt>
        <dd>{{ config.data.hierarchy.subcomponent }}</dd>
        {% endif %}
    </dl>
</section>

{# Preview of this component #}
<section id="component-{{ data.name }}-preview">
    <{{ heading }}>Preview</{{ heading }}>
    {% set breakpoints = [{name:"Mobile Portrait", x:320,y:480}, {name:"Mobile Landscape", x:480,y:320}, {name:"Tablet Portrait", x:768,y:1024}, {name:"Tablet Landscape", x:1024,y:768}, {name:"Widescreen Landscape", x:1280,y:880}] %}
    <div class="iframe-buttons">
        {% for breakpoint in breakpoints %}
            <button class="iframe-button" data-target="iframe-preview-{{ data.name }}" data-x="{{ breakpoint.x }}" data-y="{{ breakpoint.y }}">{{ breakpoint.name }}({{ breakpoint.x }} x {{ breakpoint.y }})</button>
        {% endfor %}
        <button class="iframe-button" data-target="iframe-preview-{{ data.name }}" data-min-x="320" data-max-x="1280" data-min-y="320" data-max-y="1024">Random</button>
    </div><br />
    <iframe id="iframe-preview-{{ data.name }}" src="/ui/preview/{{ component.name }}/{{ data.name }}.html" width="{{ breakpoints[0].x }}" height="{{ breakpoints[0].y }}"></iframe>
</section>

{# Documentation of this component. #}
{% if config.data.doc %}
    <section id="component-{{ data.name }}-documentation">
        <{{ heading }}>Documentation</{{ heading }}>
        {% marked %}{{ config.data.doc.contents }}{% endmarked %}
    </section>
{% endif %}


{# Code for this component #}
{% if config.data.code.css.length > 0 || config.data.code.js.length > 0 || config.data.code.html.length > 0 %}
    <section id="component-{{ data.name }}-code">
        <{{ heading }}>Code</{{ heading }}>

        {% if config.data.code.html.length > 0 %}
            <{{ subheading }}><abbr title="HyperText Markup Language">HTML</abbr></{{ subheading }}>
            {% for dep in config.data.code.html %}
                <{{ subsubheading }}>{{ dep.name }}</{{ subsubheading }}>
                <pre><code>{{ dep.contents }}</code></pre>
            {% endfor %}
        {% endif %}

        {% if config.data.code.css.length > 0 %}
            <{{ subheading }}><abbr title="Cascading StyleSheets">CSS</abbr>/<abbr title="Syntactically Awesome Stylesheets">SASS</abbr></{{ subheading }}>
            {% for dep in config.data.code.css %}
                <{{ subsubheading }}>{{ dep.name }}</{{ subsubheading }}>
                <pre><code>{{ dep.contents }}</code></pre>
            {% endfor %}
        {% endif %}

        {% if config.data.code.js.length > 0 %}
            <{{ subheading }}><abbr title="JavaScript">JS</abbr></{{ subheading }}>
            {% for dep in config.data.code.js %}
                <{{ subsubheading }}>{{ dep.name }}</{{ subsubheading }}>
                <pre><code>{{ dep.contents }}</code></pre>
            {% endfor %}
        {% endif %}

</section>
{% endif %}

{# Expected data for rendering this component. #}

{% if config.data.data %}
    <section id="component-{{ data.name }}-data">
        <{{ heading }}>Data</{{ heading }}>
        <p>{{ config.data.data.name }}</p>
        <pre><code>{{ config.data.data.contents }}</code></pre>
    </section>
{% endif %}
