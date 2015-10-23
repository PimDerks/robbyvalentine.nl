---
title: Forms
---

﻿{% extends '../_layouts/styleguide/default.swig' %}

{% set title = 'Forms' %}

{% block title %}
    {{ title }}
{% endblock title %}

{% block header %}
    {{ title }}
{% endblock header %}

{% block content %}

    <form action=".">
        <fieldset>
            <legend>Default input types</legend>

            <label for="search">Search</label>
            <input type="search" id="search" />

            <label for="default">Default input</label>
            <input type="text" id="default"/>

            <label for="default-disabled">Default input (disabled)</label>
            <input type="text" id="default-disabled" disabled />

            <label for="placeholder">Default input with placeholder</label>
            <input type="text" id="placeholder" placeholder="e.g. John Doe" />

            <label for="required">Required input</label>
            <input type="text" required="required" placeholder="e.g. John Doe" id="required"/>
            <label for="required" data-type="error">This is a required input.</label>

            <label for="email">E-mail</label>
            <input type="email" placeholder="e.g. john@doe.com" id="email" />

            <label for="date">Date</label>
            <input type="date" id="date" />

            <label for="number">Number</label>
            <input type="number" min="21" max="105" id="number" />

            <label for="phone">Phone</label>
            <input type="tel" pattern="\d{3}-\d{3}-\d{4}" placeholder="XXX-XXX-XXXX" id="phone" />

            <label for="range">Satisfaction</label>
            <input type="range" id="range" min="0" max="10" step="1" list="rangelist" />
            <datalist id="rangelist">
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </datalist>

            <label for="select">Select</label>
            <select id="select" name="select" size="1">
                <option>one</option>
                <option selected>two (default)</option>
                <option>three</option>
            </select>

            <label for="f10">Select (disabled)</label>
            <select id="f10" name="select1" size="1" disabled>
                <option>one</option>
                <option selected>two (default)</option>
                <option>three</option>
            </select>

            <label for="f2">Textarea</label>
            <textarea id="f2" name="textarea" rows="2" cols="20">Default text.</textarea>

            <label for="f2">Textarea (disabled)</label>
            <textarea id="f2" name="textarea" rows="2" cols="20" disabled>Default text.</textarea>

            <input id="radio-1" type="radio" name="radio" />
            <label for="radio-1">Radio button 1</label>

            <fieldset>
                <legend>Choices</legend>

                <input id="radio-2" type="radio" name="radio" />
                <label for="radio-2">Radio button 2</label>

                <input id="radio-3" type="radio" name="radio" />
                <label for="radio-3">Radio button 3</label>

                <input id="radio-4" type="radio" name="radio" disabled />
                <label for="radio-4">Radio button 3</label>

            </fieldset>

            <input id="checkbox-1" type="radio" name="radio" />
            <label for="checkbox-1">Checkbox 1</label>

            <fieldset>
                <legend>Options</legend>
                <input id="checkbox-2" type="radio" name="radio" />
                <label for="checkbox-2">Checkbox 2</label>

                <input id="checkbox-3" type="radio" name="radio" />
                <label for="checkbox-3">Checkbox 3</label>

                <input id="checkbox-4" type="radio" name="radio" disabled />
                <label for="checkbox-4">Checkbox 4</label>

            </fieldset>

            <input type="submit" value="Submit Input">
            <input type="reset" value="Reset Input">
            <button type="submit">Submit Button</button>
            <button type="reset">Reset Button</button>
            <button type="button">Button</button>

        </fieldset>

    </form>

{% endblock %}