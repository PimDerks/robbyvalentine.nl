{% include "../shared/document-open.swig" %}

    <head>

        {% include "../shared/document-head.swig" %}

        <title>
            {% block title %}
                Default title
            {% endblock %} - {{ data.settings.project }}
        </title>

        {% include "sublayouts/document-head-includes.swig" %}
        {% include "sublayouts/document-head-og-data.swig" %}

    </head>
    <body>

        <img src="/prototype/static/img/placeholder.png" />

        <div id="skip-links">
            <ul>
                <li><a href="#main-content">Spring naar inhoud</a></li>
                <li><a href="#main-navigation">Spring naar navigatie</a></li>
                <li><a href="#main-footer">Spring naar contactgegevens</a></li>
                <li><a href="#search">Spring naar zoeken</a></li>
            </ul>
        </div>

        <main id="main-content">
            {% block content %}
            {% endblock %}
        </main>

        <header>
            <h1>Iquality Front-end boilerplate</h1>
        </header>

        <nav id="main-navigation">
            <h2>Navigatie</h2>
            <ul>
                {% for navItem in data.navigation %}
                    <li>
                        <a href="{{ navItem.link }}">{{ navItem.title }}</a>
                        {% if navItem.subitems and navItem.subitems.length > 0 %}
                            <ul>
                                {% for subItem in navItem.subitems %}
                                    <li>
                                        <a href="{{ subItem.link }}">{{ subItem.title }}</a>
                                        {% if subItem.subitems and subItem.subitems.length > 0 %}
                                            <ul>
                                                {% for subSubItem in subItem.subitems %}
                                                    <li>
                                                        <a href="{{ subSubItem.link }}">{{ subSubItem.title }}</a>
                                                    </li>
                                                {% endfor %}
                                            </ul>
                                        {% endif %}
                                    </li>
                                {% endfor %}
                            </ul>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </nav>

        <form id="search" role="search">
            <h2>Zoeken</h2>
            <legend>Zoeken</legend>
            <label for="search-input">Searchterm</label>
            <input type="search" placeholder="e.g. app" />
            <button type="submit">Search</button>
        </form>

        <footer id="main-footer">
            <h2>Contact</h2>
            <div vocab="http://schema.org/" typeof="Organization">
                <div property="name">Iquality</div>
                <img src="http://lorempixel.com/640/480" property="logo" alt="" />
                <h3>Adres</h3>
                <dl property="address" typeof="PostalAddress">
                    <dt>Adres</dt>
                    <dd property="streetAddress">Jonkerbosplein 52</dd>
                    <dt>Postcode</dt>
                    <dd property="postalCode">1234AA</dd>
                    <dt>Stad</dt>
                    <dd property="addressLocality">Nijmegen</dd>
                    <dt>Provincie</dt>
                    <dd property="addressRegion">Gelderland</dd>
                </dl>
                <h3>Contactgegevens</h3>
                <dl>
                    <dt>E-mail</dt>
                    <dd><a property="email" href="mailto:info@iquality.nl" content="info@iquality.nl">info@iquality.nl</a></dd>
                    <dt>Telefoon</dt>
                    <dd><a property="telephone" content="0241234567" href="tel:0241234567">024 - 12 34 56 78</a></dd>
                    <dt>Skype</dt>
                    <dd><a href="skype:iqualitybv">iqualitybv</a></dd>
                    <dt>Twitter</dt>
                    <dd><a href="http://twitter.com/iquality">@iquality</a></dd>
                    <dt>Homepage</dt>
                    <dd><a href="http://www.iquality.nl" property="url">http://www.iquality.nl</a></dd>
                </dl>
            </div>
        </footer>

        {% include "sublayouts/document-scripts.swig" %}

{% include "../shared/document-foot.swig" %}