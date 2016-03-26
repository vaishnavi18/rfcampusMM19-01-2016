var canvasLoader=function(t,i,e){var a=this;this.c=t,this.ctx=t.getContext("2d"),this.cw=i,this.ch=e,this.loaded=0,this.loaderSpeed=.14,this.loaderHeight=15,this.loaderWidth=410,this.loader={x:this.cw/2-this.loaderWidth/2,y:this.ch/2-this.loaderHeight/2},this.particles=[],this.particleLift=180,this.hueStart=0,this.hueEnd=120,this.hue=0,this.gravity=.15,this.particleRate=4,this.init=function(){this.loop()},this.rand=function(t,i){return~~(Math.random()*(i-t+1)+t)},this.hitTest=function(t,i,e,a,h,r,s,n){return!(h>t+e||t>h+s||r>i+a||i>r+n)},this.updateLoader=function(){this.loaded<100?this.loaded+=this.loaderSpeed:this.loaded=0},this.renderLoader=function(){this.ctx.fillStyle="#000",this.ctx.fillRect(this.loader.x,this.loader.y,this.loaderWidth,this.loaderHeight),this.hue=this.hueStart+this.loaded/100*(this.hueEnd-this.hueStart);var t=this.loaded/100*this.loaderWidth;this.ctx.fillStyle="hsla("+this.hue+", 100%, 40%, 1)",this.ctx.fillRect(this.loader.x,this.loader.y,t,this.loaderHeight),this.ctx.fillStyle="#222",this.ctx.fillRect(this.loader.x,this.loader.y,t,this.loaderHeight/2)},this.Particle=function(){this.x=a.loader.x+a.loaded/100*a.loaderWidth-a.rand(0,1),this.y=a.ch/2+a.rand(0,a.loaderHeight)-a.loaderHeight/2,this.vx=(a.rand(0,4)-2)/100,this.vy=(a.rand(0,a.particleLift)-2*a.particleLift)/100,this.width=a.rand(1,4)/2,this.height=a.rand(1,4)/2,this.hue=a.hue},this.Particle.prototype.update=function(t){this.vx+=(a.rand(0,6)-3)/100,this.vy+=a.gravity,this.x+=this.vx,this.y+=this.vy,this.y>a.ch&&a.particles.splice(t,1)},this.Particle.prototype.render=function(){a.ctx.fillStyle="hsla("+this.hue+", 100%, "+a.rand(50,70)+"%, "+a.rand(20,100)/100+")",a.ctx.fillRect(this.x,this.y,this.width,this.height)},this.createParticles=function(){for(var t=this.particleRate;t--;)this.particles.push(new this.Particle)},this.updateParticles=function(){for(var t=this.particles.length;t--;){var i=this.particles[t];i.update(t)}},this.renderParticles=function(){for(var t=this.particles.length;t--;){var i=this.particles[t];i.render()}},this.clearCanvas=function(){this.ctx.globalCompositeOperation="source-over",this.ctx.clearRect(0,0,this.cw,this.ch),this.ctx.globalCompositeOperation="lighter"},this.loop=function(){var t=function(){requestAnimationFrame(t,a.c),a.clearCanvas(),a.createParticles(),a.updateLoader(),a.updateParticles(),a.renderLoader(),a.renderParticles()};t()}},isCanvasSupported=function(){var t=document.createElement("canvas");return!(!t.getContext||!t.getContext("2d"))},setupRAF=function(){for(var t=0,i=["ms","moz","webkit","o"],e=0;e<i.length&&!window.requestAnimationFrame;++e)window.requestAnimationFrame=window[i[e]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[i[e]+"CancelAnimationFrame"]||window[i[e]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(i){var e=(new Date).getTime(),a=Math.max(0,16-(e-t)),h=window.setTimeout(function(){i(e+a)},a);return t=e+a,h}),window.cancelAnimationFrame||(window.cancelAnimationFrame=function(t){clearTimeout(t)})};if(isCanvasSupported){var c=document.createElement("canvas");c.width=400,c.height=100;var cw=c.width,ch=c.height;document.body.appendChild(c);var cl=new canvasLoader(c,cw,ch);setupRAF(),cl.init()}