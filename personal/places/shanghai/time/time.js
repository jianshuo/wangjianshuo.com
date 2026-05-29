// Script to show the local time of Luoyang.
// Author: Jian Shuo Wang
// Based on: script on the original script on http://www.shanghai-ed.com
// Last updated: Feb 20, 2002

// Buffer all the images to local disk (memory)

prefix = "../luoyang/time/c"

c1=new Image(); 
c1.src=prefix + "1.gif"
c2=new Image(); 
c2.src=prefix + "2.gif"
c3=new Image(); 
c3.src=prefix + "3.gif"
c4=new Image(); 
c4.src=prefix + "4.gif"
c5=new Image(); 
c5.src=prefix + "5.gif"
c6=new Image(); 
c6.src=prefix + "6.gif"
c7=new Image(); 
c7.src=prefix + "7.gif"
c8=new Image(); 
c8.src=prefix + "8.gif"
c9=new Image(); 
c9.src=prefix + "9.gif"
c0=new Image(); 
c0.src=prefix + "0.gif"
cb=new Image(); 
cb.src=prefix + "b.gif"
cam=new Image();
cam.src=prefix + "am.gif"
cpm=new Image(); 
cpm.src=prefix + "pm.gif"

function extract(h,m,s,type)
{
  if (!document.images)
    return

  if (h<=9)
   {
     document.images.a.src=cb.src
	 document.images.b.src=eval("c"+h+".src")
   }else{
     document.images.a.src=eval("c"+Math.floor(h/10)+".src")
	 document.images.b.src=eval("c"+(h%10)+".src")
   }
  
  if (m<=9)
   {
     document.images.d.src=c0.src
	 document.images.e.src=eval("c"+m+".src")
   }else{
     document.images.d.src=eval("c"+Math.floor(m/10)+".src")
	 document.images.e.src=eval("c"+(m%10)+".src")
   }

  if (s<=9)
   {
     document.images.g.src=c0.src
	 document.images.h.src=eval("c"+s+".src")
   }else{
     document.images.g.src=eval("c"+Math.floor(s/10)+".src")
	 document.images.h.src=eval("c"+(s%10)+".src")
   }

   if (dn=="AM") 
      document.images.j.src=cam.src
   else 
      document.images.j.src=cpm.src

}

function showClock( )
{
  if (!document.images)
    return
  
  var Digital=new Date()
  var hours=Digital.getHours()
  var minutes=Digital.getMinutes()
  var seconds=Digital.getSeconds()
  
  dn="AM" 

  if ((hours>=12)&&(minutes>=1)||(hours>=13))
   {
     dn="PM"
	 hours=hours-12
   }

   if (hours==0)
     hours=12
	 
	extract(hours,minutes,seconds,dn)
	setTimeout("showClock()",1000)

}
