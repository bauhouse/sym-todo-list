<?php

class eventsave_lists extends SectionEvent
{
    public $ROOTELEMENT = 'save-lists';

    public $eParamFILTERS = array(
        'expect-multiple'
    );

    public static function about()
    {
        return array(
            'name' => 'Save Lists',
            'author' => array(
                'name' => 'Stephen Bau',
                'website' => 'http://sym.todo.test',
                'email' => 'stephen@domain7.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2020-04-19T02:50:44+00:00',
            'trigger-condition' => 'action[save-lists]'
        );
    }

    public static function getSource()
    {
        return '1';
    }

    public static function allowEditorToParse()
    {
        return true;
    }

    public static function documentation()
    {
        return '
                <h3>Success and Failure XML Examples</h3>
                <p>When saved successfully, the following XML will be returned:</p>
                <pre class="XML"><code>&lt;save-lists>
    &lt;entry index="0" result="success" type="create | edit">
        &lt;message>Entry [created | edited] successfully.&lt;/message>
    &lt;/entry>
&lt;/save-lists></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <p>Notice that it is possible to get mixtures of success and failure messages when using the ‘Allow Multiple’ option.</p>
                <pre class="XML"><code>&lt;save-lists>
    &lt;entry index="0" result="error">
        &lt;message>Entry encountered errors when saving.&lt;/message>
        &lt;field-name type="invalid | missing" />
    &lt;/entry>
    &lt;entry index="1" result="success" type="create | edit">
        &lt;message>Entry [created | edited] successfully.&lt;/message>
    &lt;/entry>
...&lt;/save-lists></code></pre>
                <p>The following is an example of what is returned if any options return an error:</p>
                <pre class="XML"><code>&lt;save-lists result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;filter name="admin-only" status="failed" />
    &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
...&lt;/save-lists></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
    &lt;label>Name
        &lt;input name="fields[0][name]" type="text" />
    &lt;/label>
    &lt;input name="fields[0][items]" type="hidden" value="..." />
    &lt;input name="action[save-lists]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id[0]" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://sym.todo.test/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['save-lists'])) {
            return $this->__trigger();
        }
    }

}
