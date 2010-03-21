<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventsave_lists extends Event{
		
		const ROOTELEMENT = 'save-lists';
		
		public $eParamFILTERS = array(
			'expect-multiple'
		);
			
		public static function about(){
			return array(
					 'name' => 'Save Lists',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://home/sym/todolist',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-03-21T13:27:13+00:00',
					 'trigger-condition' => 'action[save-lists]');	
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-lists>
  &lt;entry index="0" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
&lt;/save-lists></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned (<b>Notice that it is possible to get mixtures of success and failure messages when using the "Allow Multiple" option</b>):</p>
        <pre class="XML"><code>&lt;save-lists>
  &lt;entry index="0" result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
  &lt;/entry>
  &lt;entry index="1" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
  ...
&lt;/save-lists></code></pre>
        <p>The following is an example of what is returned if any filters fail:</p>
        <pre class="XML"><code>&lt;save-lists result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/save-lists></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[0][name]" type="text" />
  &lt;/label>
  &lt;select name="fields[0][items]">
    &lt;option value="...">...&lt;/option>
  &lt;/select>
  &lt;input name="action[save-lists]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id[0]" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://home/sym/todolist/success/" /></code></pre>';
		}
		
		public function load(){			
			if(isset($_POST['action']['save-lists'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}

