<?php

class eventsave_item extends SectionEvent
{
    public $ROOTELEMENT = 'save-item';

    public $eParamFILTERS = array(
        
    );

    public static function about()
    {
        return array(
            'name' => 'Save Item',
            'author' => array(
                'name' => 'Stephen Bau',
                'website' => 'http://sym.todo.test',
                'email' => 'stephen@domain7.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2020-04-19T16:34:12+00:00',
            'trigger-condition' => 'action[save-item]'
        );
    }

    public static function getSource()
    {
        return '2';
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
                <pre class="XML"><code>&lt;save-item result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/save-item></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;save-item result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/save-item></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
    &lt;label>To Do
        &lt;input name="fields[to-do]" type="text" />
    &lt;/label>
    &lt;label>Done
        &lt;input name="fields[done]" type="checkbox" value="yes" />
    &lt;/label>
    &lt;label>Order
        &lt;input name="fields[order]" type="text" />
    &lt;/label>
    &lt;input name="fields[list]" type="hidden" value="..." />
    &lt;input name="action[save-item]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://sym.todo.test/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['save-item'])) {
            return $this->__trigger();
        }
    }

}
