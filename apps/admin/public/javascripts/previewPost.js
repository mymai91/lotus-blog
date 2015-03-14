/** @jsx React.DOM */

var converter = new Showdown.converter();

var PreviewPostComponent = React.createClass({
  mixins: [React.addons.LinkedStateMixin],
  openTabContent: function (e) {
    e.preventDefault();
    var target = $(e.target),
        idTag = target.attr('href');
    $('.tab-title a').removeClass('is-active');
    target.addClass('is-active');
    $('.tabs .tab-content').removeClass('is-active');
    $(idTag).addClass('is-active');
  },
  getInitialState: function () {
    return {
      postContent: ''
    };
  },
  render: function () {
    var postContent = converter.makeHtml(this.state.postContent);

    return (
      <div className="tabs tiny-spacing-bottom">
        <ul className="clear-fix tabs-header" onClick={this.openTabContent}>
          <li className="tab-title">
            <a href="#link-tab-write-content" className="is-active">Content</a>
          </li>
          <li className="tab-title">
            <a href="#link-tab-preview-preview">Preview</a>
          </li>
        </ul>
        <div className="tabs-content">
          <textarea id="link-tab-write-content" 
                    className="tab-content is-active" 
                    name="post[content]" 
                    placeholder="Content"
                    valueLink={this.linkState('postContent')}></textarea>
          <div id="link-tab-preview-preview" className="tab-content">
            {this.state.postContent.length != 0 ? <p className="tiny-spacing-in" dangerouslySetInnerHTML={{__html: postContent}}></p> : <p className="tiny-spacing-in-right tiny-spacing-in-left">Nothing to preview</p>}
          </div>
        </div>
      </div>
    );
  }
});

var renderPreviewPostComponent = React.renderComponent(
  <PreviewPostComponent />,
  document.getElementById('previewPost')
);