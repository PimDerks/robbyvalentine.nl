---
title: Elements
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Elements' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}
{% block content %}

    <h1>Testing display of HTML elements</h1>

    <h2>Lorem ipsum dolor sit amet</h2>
    <p>Consectetur adipiscing elit. Phasellus tincidunt hendrerit arcu, quis laoreet tortor malesuada at. Suspendisse augue nulla, rutrum sed risus vel, venenatis pharetra erat. Suspendisse potenti. Cras mi massa, scelerisque id mollis condimentum, eleifend in augue.</p>
    <p>Etiam feugiat nibh id lectus viverra, ac malesuada eros lacinia. Donec vel tortor pulvinar enim aliquet faucibus sagittis non lorem. Nunc ut purus ac odio dictum condimentum. Morbi dolor ex, rutrum at venenatis ut, congue quis enim. Aliquam at nisi nec augue congue feugiat. Morbi viverra purus quis tortor eleifend, vitae commodo dui accumsan. Integer leo nisi, porttitor id tortor sed, hendrerit laoreet nisi. Donec commodo pellentesque elit nec ullamcorper. Curabitur vel nibh nibh. In non magna viverra, consequat eros ac, ullamcorper felis.</p>

    <h3>Duis dapibus lorem et lorem ultrices</h3>
    <p>Laoreet mollis mi fringilla. Nullam mauris velit, interdum ultricies efficitur a, vehicula at ligula. Duis maximus arcu id tristique fermentum. Vestibulum a tempor justo.</p>
    <p>Vestibulum nec sem finibus, efficitur sem a, pharetra libero. Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit. Donec in sodales purus, et laoreet ex.</p>

    <h4>Nulla eget diam molestie, suscipit nunc efficitur, pharetra massa.</h4>
    <p>Phasellus libero neque, fringilla euismod enim in, fringilla maximus augue. Duis elit augue, rhoncus posuere dignissim et, sollicitudin et lorem. Integer viverra congue augue, ut dapibus lacus porta eu.</p>
    <p>Vestibulum nec sem finibus, efficitur sem a, pharetra libero. Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit. Donec in sodales purus, et laoreet ex.</p>

    <h5>Duis efficitur, elit quis aliquet dignissim</h5>
    <p>Sem nibh ullamcorper turpis, sed sodales justo risus eget orci. Quisque consequat ultricies sapien non faucibus. Duis at iaculis eros. Etiam molestie, lectus maximus tincidunt fermentum, diam eros congue quam, id vestibulum tortor elit nec ligula. Mauris sed placerat lectus, at mattis ipsum. Aliquam urna quam, rhoncus at lacinia eget, molestie in ligula. Nulla euismod metus turpis, non aliquet enim egestas non. Maecenas pulvinar mauris ac nisl auctor, lacinia viverra augue placerat. Nunc urna ligula, vulputate vitae arcu nec, scelerisque vestibulum ligula. Vivamus at ante pretium, ornare nisl sit amet, consequat elit. Aliquam imperdiet nunc ac libero gravida, eu commodo arcu convallis. Nulla efficitur, metus sed lobortis egestas, sapien risus varius nunc, et faucibus nisi orci eu enim.</p>
    <p>Vestibulum nec sem finibus, efficitur sem a, pharetra libero. Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit. Donec in sodales purus, et laoreet ex.</p>
    <h2>Basic block level elements</h2>

    <p>Vestibulum nec sem finibus, efficitur sem a, pharetra libero. Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit. Donec in sodales purus, et laoreet ex.</p>
    <p>Etiam feugiat nibh id lectus viverra, ac malesuada eros lacinia. Donec vel tortor pulvinar enim aliquet faucibus sagittis non lorem. Nunc ut purus ac odio dictum condimentum. Morbi dolor ex, rutrum at venenatis ut, congue quis enim. Aliquam at nisi nec augue congue feugiat. Morbi viverra purus quis tortor eleifend, vitae commodo dui accumsan. Integer leo nisi, porttitor id tortor sed, hendrerit laoreet nisi. Donec commodo pellentesque elit nec ullamcorper. Curabitur vel nibh nibh. In non magna viverra, consequat eros ac, ullamcorper felis.</p>

    <div>This is a <code>div</code> element. Authors may use such elements instead
        of paragraph markup for various reasons. (End of <code>div</code>.)</div>

    <blockquote>
        <p>This is a block quotation containing a single paragraph. Well, not quite, since this is not <em>really</em> quoted text, but I hope you understand the point. After all, this page does not use HTML markup very normally anyway.</p>
    </blockquote>

    <p>The following contains address information about the author, in an <code>address</code> element.</p>

    <address>
        <a href="http://">Author</a>,
        <a href="mailto:author@domain.com">author@domain.com</a>
    </address>

    <h2>Lists</h2>

    <p>Etiam feugiat nibh id lectus viverra, ac malesuada eros lacinia. Donec vel tortor pulvinar enim aliquet faucibus sagittis non lorem. Nunc ut purus ac odio dictum condimentum. Morbi dolor ex, rutrum at venenatis ut, congue quis enim. Aliquam at nisi nec augue congue feugiat. Morbi viverra purus quis tortor eleifend, vitae commodo dui accumsan. Integer leo nisi, porttitor id tortor sed, hendrerit laoreet nisi. Donec commodo pellentesque elit nec ullamcorper. Curabitur vel nibh nibh. In non magna viverra, consequat eros ac, ullamcorper felis.</p>

    <ul>
        <li>Vestibulum nec sem finibus, efficitur sem a, pharetra libero.</li>
        <li>Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit.</li>
        <li>Donec in sodales purus, et laoreet ex.</li>
    </ul>

    <p>Etiam feugiat nibh id lectus viverra, ac malesuada eros lacinia. Donec vel tortor pulvinar enim aliquet faucibus sagittis non lorem. Nunc ut purus ac odio dictum condimentum. Morbi dolor ex, rutrum at venenatis ut, congue quis enim. Aliquam at nisi nec augue congue feugiat. Morbi viverra purus quis tortor eleifend, vitae commodo dui accumsan. Integer leo nisi, porttitor id tortor sed, hendrerit laoreet nisi. Donec commodo pellentesque elit nec ullamcorper. Curabitur vel nibh nibh. In non magna viverra, consequat eros ac, ullamcorper felis.</p>

    <ol>
        <li>Vestibulum nec sem finibus, efficitur sem a, pharetra libero.</li>
        <li>Cras eu urna aliquam, viverra erat quis, condimentum diam. Morbi interdum tempus velit.</li>
        <li>Donec in sodales purus, et laoreet ex.</li>
    </ol>

    <p>Etiam feugiat nibh id lectus viverra, ac malesuada eros lacinia. Donec vel tortor pulvinar enim aliquet faucibus sagittis non lorem. Nunc ut purus ac odio dictum condimentum. Morbi dolor ex, rutrum at venenatis ut, congue quis enim. Aliquam at nisi nec augue congue feugiat. Morbi viverra purus quis tortor eleifend, vitae commodo dui accumsan. Integer leo nisi, porttitor id tortor sed, hendrerit laoreet nisi. Donec commodo pellentesque elit nec ullamcorper. Curabitur vel nibh nibh. In non magna viverra, consequat eros ac, ullamcorper felis.</p>

    <dl>
        <dt>Etiam feugiat</dt>
        <dd>Hibh id lectus viverra, ac malesuada eros lacinia.</dd>
        <dt>Donec vel tortor pulvinar</dt>
        <dd>Enim aliquet faucibus sagittis non lorem.</dd>
        <dt>Nunc ut purus ac odio dictum condimentum</dt>
        <dd>Morbi dolor ex, rutrum at venenatis ut, congue quis enim.</dd>
    </dl>

    <h2>Text-level markup</h2>

    <ul>
        <li> <abbr title="Cascading Style Sheets">CSS</abbr> (an abbreviation;
            <code>abbr</code> markup used)</li>
        <li> <b>bolded</b> (<code>b</code> markup used - just bolding with unspecified
            semantics)</li>
        <li> <cite>Origin of Species</cite> (a book title;
            <code>cite</code> markup used)</li>
        <li> <code>a[i] = b[i] + c[i);</code> (computer code; <code>code</code> markup used)</li>
        <li> here we have some <del>deleted</del> text (<code>del</code> markup used)</li>
        <li> an <dfn>octet</dfn> is an entity consisting of eight bits
            (<code>dfn</code> markup used for the term being defined)</li>
        <li> this is <em>very</em> simple (<code>em</code> markup used for emphasizing
            a word)</li>
        <li> <i lang="la">Homo sapiens</i> (should appear in italics;  <code>i</code> markup used)</li>
        <li> here we have some <ins>inserted</ins> text (<code>ins</code> markup used)</li>
        <li> type <kbd>yes</kbd> when prompted for an answer (<code>kbd</code> markup
            used for text indicating keyboard input)</li>
        <li> <q>Hello!</q> (<code>q</code> markup used for quotation)</li>
        <li> He said: <q>She said <q>Hello!</q></q> (a quotation inside a quotation)</li>
        <li> you may get the message <samp>Core dumped</samp> at times
            (<code>samp</code> markup used for sample output)</li>
        <li> <small>this is not that important</small> (<code>small</code> markup used)</li>
        <li> <strong>this is highlighted text</strong> (<code>strong</code>
            markup used)</li>
        <li> In order to test how subscripts and superscripts (<code>sub</code> and
            <code>sup</code> markup) work inside running text, we need some
            dummy text around constructs like x<sub>1</sub> and H<sub>2</sub>O
            (where subscripts occur). So here is some fill so that
            you will (hopefully) see whether and how badly the subscripts
            and superscripts mess up vertical spacing between lines.
            Now superscripts: M<sup>lle</sup>, 1<sup>st</sup>, and then some
            mathematical notations: e<sup>x</sup>, sin<sup>2</sup> <i>x</i>,
            and some nested superscripts (exponents) too:
            e<sup>x<sup>2</sup></sup> and f(x)<sup>g(x)<sup>a+b+c</sup></sup>
            (where 2 and a+b+c should appear as exponents of exponents).</li>
        <li> the command <code>cat</code> <var>filename</var> displays the
            file specified by the <var>filename</var> (<code>var</code> markup
            used to indicate a word as a variable).</li>
    </ul>

    <p>Some of the elements tested above are typically displayed in a monospace
        font, often using the <em>same</em> presentation for all of them. This
        tests whether that is the case on your browser:</p>

    <ul>
        <li><code>This is sample text inside code markup</code></li>
        <li><kbd>This is sample text inside kbd markup</kbd></li>
        <li><samp>This is sample text inside samp markup</samp></li>
    </ul>

    <h2>Links</h2>
    <ul>
        <li><a href="/">Link</a></li>
        <li><a href="/" title="Link with title">Link with title</a></li>
        <li><a href="http://www.">External Link</a></li>
    </ul>

    <p>This is a text paragraph that contains some
        inline links. Generally, inline links (as opposite to e.g. links
        lists) are problematic
        from the
        <a href="http://www.useit.com">usability</a> perspective,
        but they may have use as
        &#8220;incidental&#8221;, less relevant links. See the document
        <cite><a href="http://">Links Want To Be Links</a></cite>.</p>

    <h2>Tables</h2>

    <p>The following table has a caption. The first row is in a thead, the second row is the tfoot, and the rest is in a tbody. The first column
        contain table header cells (<code>th</code> elements) only; other cells
        are data cells (<code>td</code> elements):</p>

    <table>
        <caption>Sample table: Areas of the Nordic countries, in sq km</caption>
        <thead><tr><th scope="col">Country</th> <th scope="col">Total area</th> <th scope="col">Land area</th></tr></thead>
        <tfoot><tr><th scope="col">Country</th> <th scope="col">Total area</th> <th scope="col">Land area</th></tr></tfoot>
        <tbody>
        <tr><th scope="row">Denmark</th> <td> 43,070 </td><td> 42,370</td></tr>
        <tr><th scope="row">Finland</th> <td>337,030 </td><td>305,470</td></tr>
        <tr><th scope="row">Iceland</th> <td>103,000 </td><td>100,250</td></tr>
        <tr><th scope="row">Norway</th>  <td>324,220 </td><td>307,860</td></tr>
        <tr><th scope="row">Sweden</th>  <td>449,964 </td><td>410,928</td></tr>
        </tbody>
    </table>

    <h2>HTML5 Elements</h2>

    <h3>Details and Summary</h3>
    <details>
        <summary>This is the summary of the details</summary>
        <p>This is a paragraph within a <code>details</code> element, outside of the <code>summary</code></p>
    </details>

    <h3>Figure and Figcaption</h3>
    <figure>
        <img src="http://lorempixel.com/640/480" alt="Image">
        <figcaption>This is the figcaption</figcaption>
    </figure>

    <dialog>This is a dialog</dialog>

    <p>This paragraph has a <mark>mark</mark></p>

    <h3>Meter</h3>
    <ul>
        <li><meter value="0">Meter</meter></li>
        <li><meter value="1" min="0" max="4" low="2" high="3">1 of 4</meter></li>
        <li><meter value="2" min="0" max="4" low="1" high="3">2 of 4</meter></li>
        <li><meter value="61" min="0" max="100" low="73" high="87" optimum="100">61</meter></li>
    </ul>
    <h3>Progress</h3>
    <ul>
        <li><progress>Empty</progress></li>
        <li><progress max="100" value="17">17% complete</progress></li>
        <li><progress value="75" max="100">75% complete</progress></li>
    </ul>

{% endblock %}

