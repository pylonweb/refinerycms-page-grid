var page_options = {
  initialised: false
  , init: function(enable_parts, new_part_url, del_part_url){

    if (!this.initialised) {
      // set the page tabs up, but ensure that all tabs are shown so that when wymeditor loads it has a proper height.
      page_options.tabs = $('#page-tabs');
      page_options.tabs.tabs({tabTemplate: '<li><a href="#{href}">#{label}</a></li>'});
      page_options.tabs.find(' > ul li a').corner('top 5px');

      part_shown = $('#page-tabs .page_part.field').not('.ui-tabs-hide');
      $('#page-tabs .page_part.field').removeClass('ui-tabs-hide');

      this.enable_parts = enable_parts;
      this.new_part_url = new_part_url;
      this.del_part_url = del_part_url;
      this.show_options();

      $(document).ready($.proxy(function(){
        // hide the tabs that are supposed to be hidden.
        $('#page-tabs .page_part.field').not(this).addClass('ui-tabs-hide');
        $('#page-tabs > ul li a').corner('top 5px');

        // CHANGES ADDED HERE:
        // Moving bottom section to correct place
        $('.page_part .wym_area_bottom').each(function() {
					$(this).prev('.wym_box').append($(this));
				});
				// CHANGES ENDED
      }, part_shown));

      if(this.enable_parts){
        this.page_part_dialog();
      }
      this.initialised = true;
    }
  },

  show_options: function(){
    $('#toggle_advanced_options').click(function(e){
      e.preventDefault();
      $('#more_options').animate({opacity: 'toggle', height: 'toggle'}, 250);

      $('html,body').animate({
        scrollTop: $('#toggle_advanced_options').parent().offset().top
      }, 250);
    });
  },

  page_part_dialog: function(){
    $('#new_page_part_dialog').dialog({
      title: 'Create Content Section',
      modal: true,
      resizable: false,
      autoOpen: false,
      width: 600,
      height: 200
    });

    $('#add_page_part').click(function(e){
      e.preventDefault();
      $('#new_page_part_dialog').dialog('open');
    });

    $('#new_page_part_save').click(function(e){
      e.preventDefault();

      var part_title = $('#new_page_part_title').val();

      if(part_title.length > 0){
        var tab_title = part_title.toLowerCase().replace(" ", "_");

        if ($('#part_' + tab_title).size() === 0) {
          $.get(page_options.new_part_url, {
              title: part_title
              , part_index: $('#new_page_part_index').val()
              , body: ''
            }, function(data, status){
              $('#submit_continue_button').remove();
              // Add a new tab for the new content section.
              $('#page_part_editors').append(data);
              page_options.tabs.tabs('add', '#page_part_new_' + $('#new_page_part_index').val(), part_title);
              // this is here because of https://github.com/refinery/refinerycms/issues/2060
              $("#page-tabs #page_parts li").last().attr("data-index", $('#new_page_part_index').val());

              page_options.tabs.tabs('select', $('#new_page_part_index').val());

              // hook into wymeditor to instruct it to select this new tab again once it has loaded.
              WYMeditor.onload_functions.push(function() {
                page_options.tabs.tabs('select', $('#new_page_part_index').val());
              });

              // turn the new textarea into a wymeditor.
              $('#page_part_new_' + $('#new_page_part_index').val()).appendTo('#page_part_editors')
              WYMeditor.init();

              // Wipe the title and increment the index counter by one.
              $('#new_page_part_index').val(parseInt($('#new_page_part_index').val(), 10) + 1);
              $('#new_page_part_title').val('');

              page_options.tabs.find('> ul li a').corner('top 5px');

              // CHANGES ADDED HERE:
              // Add bottom_content
							$('.page_part .wym_area_bottom').each(function() {
								$(this).prev('.wym_box').append($(this));
						 	});
						 	// CHANGES COMPLETE

              $('#new_page_part_dialog').dialog('close');
            }, 'html'
          );
        }else{
          alert("A content section with that title already exists, please choose another.");
        }
      }else{
        alert("You have not entered a title for the content section, please enter one.");
      }
    });

    $('#new_page_part_cancel').click(function(e){
      e.preventDefault();
      $('#new_page_part_dialog').dialog('close');
      $('#new_page_part_title').val('');
    });

    $('#delete_page_part').click(function(e){
      e.preventDefault();

      if(confirm("This will remove the content section '" + $('#page_parts .ui-tabs-selected a').text() + "' immediately even if you don't save this page, are you sure?")) {
        var tabId = page_options.tabs.tabs('option', 'selected');
        $.ajax({
          url: page_options.del_part_url + '/' + $('#page_parts_attributes_' + tabId + '_id').val(),
          type: 'DELETE'
        });
        page_options.tabs.tabs('remove', tabId);
        $('#page_parts_attributes_' + tabId + '_id').remove();
        $('#submit_continue_button').remove();
      }

    });

    $('#reorder_page_part').click(function(e){
      trigger_reordering_content_section(e, true);
    });
    $('#reorder_page_part_done').click(function(e){
      trigger_reordering_content_section(e, false);
    });
  }

};