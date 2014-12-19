String.class_eval do
  def strip_heredoc
    indent = begin
      _scan = scan(/^[ \t]*(?=\S)/).min
      (_scan ? _scan.size : nil) || 0
    end
    gsub(/^[ \t]{#{indent}}/, '')
  end
end

PostRepository.clear

[
  {
    title: 'Announcing Lotus',
    content: <<-EOS.strip_heredoc
      <p>I’m pleased to announce Lotus: the Open Source project I’ve conceived, hacked and built during the last year.</p>

      <p><strong>Lotus is a full stack web framework for Ruby</strong>, built with lightness, performances and testability in mind.
      It aims to bring back Object Oriented Programming to web development, leveraging on stable APIs, a minimal DSL, and plain objects.</p>

      <h2 id="standalone-frameworks">Standalone frameworks</h2>

      <p>It’s composed by <strong>standalone frameworks</strong> (controllers, views, etc..), each one is shipped as an independent gem, in order to remark the separation of concerns.
      They can be used with any <a href="http://rack.github.io">Rack</a> compatible application for a specific need: for instance, <a href="http://lotusrb.org/router">Lotus::Router</a> can be used to dispatch HTTP requests for a pool of <a href="http://www.sinatrarb.com">Sinatra</a> applications.</p>

      <h2 id="full-stack-application">Full stack application</h2>

      <p>The other way to use Lotus is to build a full stack application with it, like <a href="http://rubyonrails.org">Rails</a> does.
      The Lotus gem is designed to enhance those frameworks’ features with a few specific conventions.</p>

      <h2 id="philosophy">Philosophy</h2>

      <p>Lotus is based on simplicity, less DSLs, few conventions, more objects, zero monkey-patching of the core language and standard lib, separation of concerns for MVC layers.
      It suggests patterns, rather than imposing. It leaves all the freedom to developers to build their own architecture, choose the inheritance structure.
      It simplifies testability, and encourages single, well defined responsibilities between classes.</p>

      <h2 id="roadmap">Roadmap</h2>

      <p>Lotus is a complex software, it needs to be completed, and to get feedback in order to became production ready.
      Some of its frameworks already have reached a certain degree of maturity, other still needs to be crafted as a gem yet.
      A single release day would be hard to meet as expectation, so I would like to suggest an experiment: to open source a component <strong>on the 23rd of every month</strong>, starting from January with <a href="http://lotusrb.org/utils">Lotus::Utils</a> and <a href="http://lotusrb.org/router">Lotus::Router</a>.</p>

      <p>Happy new year!</p>
    EOS
  },

  {
    title: 'Xin chào from Ruby Vietnam Organisation',
    content: <<-EOS.strip_heredoc
      <p><img src="http://ruby.org.vn/images/ruby-vietnam-logo.png" /></p>
      <p>After two years of hard work, I am proud to announce Ruby Vietnam Organisation</p>

      <p>Ruby is a late commer in the dense technology crowd in Vietnam. However, the
      increasing demand from the overseas outsourcing contracts, software firms are starting
      to offer Ruby / Ruby on Rails services and comes with the needs to form a community
      of Rubyists in the country.</p>

      <p>I founded Ruby Vietnam in 2012. Then it was a small group of Vietnamese Rubyists
      working overseas. All activities are through a <a href="http://ruby-vietnam.org">Facebook group</a>.
      We started many projects such as Translating ruby-lang.org site to Vietnamese. With
      time, the number of members rises very fast and we are now the most active Ruby user group
      in Vietnam.</p>

      <p>In early 2014, with support from members in Hồ Chí Minh city and sponsorships
      from various companies such as <a href="http://github.com">GitHub</a>, <a href="http://envato.com">Envato</a>,
      <a href="http://jobready.com.au">JobReady</a>, we held the first meetup.</p>

      <p>In late 2014, the group is now a registered organisation and we have successfully
      acquired the domain <a href="http://ruby.org.vn">ruby.org.vn</a>.</p>

      <p>On behalf of the committee, I'd like to thank my members and companies who have
      been on our side for the last two years. There are much works to be done, and I hope
      your continuing support for the year 2015!</p>

      <p>Merry XMAS and Happy new year!</p>
    EOS
  },

].each do |post_attrs|
  post = Post.new(post_attrs)
  PostRepository.persist(post)
end

