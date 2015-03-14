/** @jsx React.DOM */

var converter = new Showdown.converter();


var PostComponent = React.createClass({
  getInitialState: function () {
    return {
      data: [],
      displayError: false 
    };
  },
  getPostsData: function () {
    $.ajax({
      url: '/api/v1/posts',
      dataType: 'json',
      type: 'GET',
      success: function (data) {
        this.setState({data: data});
      }.bind(this),
      error: function (xhr, status, err) {
        console.log(status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function () {
    this.getPostsData();
  },
  render: function () {
    var postsContent = this.state.data.map(function (post) {
      return (
        <PostBlock title={post.title} content={post.content} path={"/posts/" + post.id} id={post.id}/>
      );
    });
    return (
      <div className="post" >
        {postsContent}
      </div>
    );
  }
});

var PostBlock = React.createClass({
  
  render: function () {
    var convertHtml = converter.makeHtml(this.props.content);
    return (
      <section id={this.props.id} >
        <header class="post-header">
          <h2 class="post-title">
            <a href={this.props.path}>{this.props.title}</a>
          </h2>
        </header>
        <div class="post-content" dangerouslySetInnerHTML={{__html: convertHtml}}></div>
      </section>
    );
  }
});

var renderPostComponent = React.renderComponent(
  <PostComponent />,
  document.getElementById('posts')
);
