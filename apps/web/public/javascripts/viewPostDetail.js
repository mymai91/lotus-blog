var postDetailId = $('#view-post-detail').attr('data-id');

var ViewPostDetailComponent = React.createClass({
  getInitialState: function () {
    return {
      title: '',
      content: ''
    };
  },
  getPostDetail: function (id) {
    if (id) {
      $.ajax({
        url: '/api/v1/posts/' + id,
        dataType: 'JSON',
        success: function (data) {
          this.setState({
            title: data.title,
            content: data.content
          });
        }.bind(this),
        error: function (err) {
          console.log(err);
        }.bind(this)
      });
    }
  },
  componentWillMount: function () {
    this.getPostDetail(postDetailId);
  },
  render: function () {
    var contentConvertHTML = converter.makeHtml(this.state.content);
    return (
      <div>
        <h2>{this.state.title}</h2>
        <div className="content" dangerouslySetInnerHTML={{__html: contentConvertHTML}}></div>
      </div>
    );
  }
});

if ($('main').find('#postDetail').length > 0) {
  var renderViewPostDetail = React.renderComponent(
    <ViewPostDetailComponent />,
    document.getElementById('postDetail')
  );
}