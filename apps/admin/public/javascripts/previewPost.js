/** @jsx React.DOM */

var converter = new Showdown.converter();

var formId = '#' + $('form').attr('id'),
    id = formId.split('-').pop().toString();

$(formId).trigger('custom', {id: id});

$(document).on('custom', function (e, data) {
  var id = data.id;
});

var PreviewPostComponent = React.createClass({
  mixins: [React.addons.LinkedStateMixin],
  getInitialState: function () {
    return {
      postContent: ''
    };
  },
  getPostContentEdit: function (id) {
    if (id) {
      $.ajax({
        url: '/api/v1/posts/' + id,
        dataType: 'json',
        success: function (data) {
          this.setState({postContent: data.content});
        }.bind(this),
        error: function (xhr, status, err) {
          console.log(status, err);
        }.bind(this)
      });
    }
  },
  componentWillMount: function () {
    this.getPostContentEdit(this.props.id);
  },
  openTabContent: function (e) {
    e.preventDefault();
    var target = $(e.target),
        idTag = target.attr('href');
    $('.tab__title a').removeClass('is_active');
    target.addClass('is_active');
    $('.tabs .tab__content').removeClass('is_active');
    $(idTag).addClass('is_active');
  },
  render: function () {
    var postContent = converter.makeHtml(this.state.postContent);
    return (
      <div className="tabs tiny_spacing_bottom">
        <ul className="clear_fix tabs__header" onClick={this.openTabContent}>
          <li className="tab__title">
            <a href="#link__tab__write__content" className="is_active">Content</a>
          </li>
          <li className="tab__title">
            <a href="#link__tab__preview__preview">Preview</a>
          </li>
        </ul>
        <div className="tabs__content">
          <textarea id="link__tab__write__content" 
                    className="tab__content is_active resize_vertical" 
                    name="post[content]" 
                    placeholder="Content"
                    valueLink={this.linkState('postContent')}></textarea>
          <div id="link__tab__preview__preview" className="tab__content">
            {this.state.postContent.length != 0 ? <p className="tiny_spacing_in_right tiny_spacing_in_left" dangerouslySetInnerHTML={{__html: postContent}}></p> : <p className="tiny_spacing_in_right tiny_spacing_in_left">Nothing to preview</p>}
          </div>
        </div>
      </div>
    );
  }
});

if ($('main').find('#post__preview').length > 0) {
  var renderPreviewPostComponent = React.renderComponent(
    <PreviewPostComponent id ={id}/>,
    document.getElementById('post__preview')
  );
}