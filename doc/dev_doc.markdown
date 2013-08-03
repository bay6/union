### 本地环境

### FAQ
Q: (Chris)我本地怎么github不能登录呢<br/>
A: 开发环境要起8080, 最好用:<br/>

```ruby
bundle exec unicorn_rails -c config/unicorn.rb
```

Q: (kaku)我的虚拟机为文字模式，通过(192.168.0.5:8080)来访问本地环境，这种情况如何登录github呢<br/>
A: 在线活动中解决了
