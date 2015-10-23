{% extends '_layouts/styleguide/index.swig' %}

{% block title %}
        Index
{% endblock %}

{% block content %}
        <div class="styleguide-wrapper">
                <nav class="styleguide-nav">
                        <img src="/prototype/static/img/placeholder.png" alt="logo" />
                        <ul>
                                <li>
                                        <span>Styleguide</span>
                                        <ul>
                                                {% for page in styleguide %}
                                                        <li>
                                                                <a href="{{ page.url }}">{{ page.title }}</a>
                                                        </li>
                                                {% endfor %}
                                        </ul>
                                </li>
                                <li>
                                        <span>Components</span>
                                        <ul>
                                                {% for component in components %}
                                                        <li>
                                                                <a href="{{ component.url }}">{{ component.title }}</a>
                                                        </li>
                                                {% endfor %}
                                        </ul>
                                </li>
                                <li>
                                        <span>Templates</span>
                                        <ul>
                                                {% for page in pages %}
                                                        <li>
                                                                <a href="{{ page.url }}">{{ page.title }}</a>
                                                        </li>
                                                {% endfor %}
                                        </ul>
                                </li>
                        </ul>
                </nav>
                <main class="styleguide-content">
                        <iframe src="" id="iframe"></iframe>
                </main>
                <script>
                        var links = document.querySelectorAll('a'),
                        iframe = document.getElementById('iframe');
                        Array.prototype.slice.apply(links).forEach(function(link){
                           link.addEventListener('click', function(e){
                                   e.preventDefault();
                                   e.stopPropagation();
                                   iframe.setAttribute('src', e.target.getAttribute('href'));
                           });
                        });
                </script>
        </div>
{% endblock %}