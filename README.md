# MIDAS
MATLAB Integrated Data Analysis Suite for UNLV's SAE Baja Team

### Welcome,

This is Rebel Racing's first expedition into creating a MATLAB application to load, clean, organize, and analyze racing data. We hope that this project will allow us to more rapidly analyze our data collection, and use the information we gain to make  meaningful decisions on the future of the car. Of course, if you have any questions you can always email me at ayalat1@unlv.nevada.edu

...oh and remember, lots of mechanical engineers are required to know how to program as a prerequisite for certain jobs. So this could give you a leg up!

## Background

#### Github
Github is an indispensable tool to help developers keep a single, organized codebase. You may be completely new to this, and that is okay (we're all here to learn anyways, right?). If that is the case, github has a nice getting started page that will introduce you to the basics entitled, [Hello World](https://guides.github.com/activities/hello-world/). It's a short read, and afterwards you should have a much better grip on how to work here. It goes over the main topics like what a repository is, branches, forking, pull requests, and more. There are also tons of other tutorials and help pages, just google something like [github fork?](https://www.google.com/search?q=github+fork%3F&oq=github+fork%3F&aqs=chrome..69i57j0l5.3355j0j7&client=ubuntu&sourceid=chrome&ie=UTF-8) and you should be well on your way. 

#### MATLAB
The engineer's programming language, created by MathWorks. MATLAB is for scientists and engineers to create apps, models, and visualizations with data to explore the world around us. Our focus with this project is Data Analytics, which seems to be MATLAB's forte. There is a good introduction to MATLAB's Data Analysis features [here](https://www.mathworks.com/solutions/data-analytics.html). Apart from that, MATLAB also has (pretty sweet) features for machine learning and neural networks, computer control systems, computer vision, robotics, and lots more (that you usually have to pay for). You can also use C, or C++ code with MATLAB as well, though it will take some extra effort. MATLAB does have some drawbacks, though we will do our best to get through them. Unfortunately for us, MATLAB isn't free or open source software, it's actually pretty expensive. If you were to purchase a license for yourself, it would set you back over $150.00 without any additional add-ons. Luckily though, many of the computers on campus (and all the ones in TBE-A computer lab) have MATLAB already installed with everything you'll need to contribute to this project. Fortunately for us, too, that the college likes us and we may be able to get you a full copy for free, just ask! If you'd really rather not use MATLAB, there is an open source alternative. [GNU Octave](https://www.gnu.org/software/octave/). Octave can run most MATLAB code, so you can always develop on this platform before testing your contributions with MATLAB. Once this project is in a reasonably useful state, we will release it on [MATLAB Central File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/). From there, our whole team will be able to download it, and get to analyzing. 

#### RaceCapture
![alt text](http://trigger-wheels.com/store/contents/media/l_racecapture_with_telemetry.jpg)

[AutosportLabs](https://www.autosportlabs.com/) produces open source racing hardware and software that will help up collect data and stream it on raceday. There are many companies similar to them, but the RaceCapture is well produced and documented (as well as being leagues cheaper) than most of the alternatives out there. Our RaceCapture Pro Mk/2 is our current data system (I know RaceCapture Pro Mk/3 is out, but we don't have the money yet!). With this system we have access to GPS, 3 axis G-Meter, acclerometers, 8 analog channels, 3 digital channels, and special channels for RPM. You can see the rest of the  specs and features of the unit on their [wiki](https://wiki.autosportlabs.com/index.php?title=RaceCapture-Pro_MK2&redirect=no). This isn't necessarily the place to talk about fabricating sensor mounts or clock speeds though, all we are concerned about here are the types of files that it produces. The RaceCapture will record the data to a file with a '.log' extension. These '.log' files are modified [.csv](https://en.wikipedia.org/wiki/Comma-separated_values) files in that they are sparsely populated. They do this to save space on the sd card while logging, but that does slightly complicate things for us here. You can take a peek at the [log-file-reference](https://wiki.autosportlabs.com/RaceCapturePro2_logfile_reference). You can find some sample '.log' files in our sample-files folder.

#### Usual .csv files will have every record filled in, like this..
```
Year,Make,Model
1997,Ford,E350
2000,Mercury,Cougar
2006,Mini,Cooper JCW
2000,Toyota,Corolla
2000,Audi,Ashton's Lame All-road
```
#### Ours, instead will look like something similar to this. A little more complicated.
```
"Interval"|"ms"|0|0|1,"Utc"|"ms"|0|0|1,"Battery"|"Volts"|0.0|50.0|1,"AccelX"|"G"|0.0|0.0|25,"AccelY"|"G"|0.0|0.0|25,"AccelZ"|"G"|0.0|0.0|25
402,0,,-0.02,-0.03,0.93,0.5,-6.2,-0.2,,,,,,,,,,,,,,,,,,,,
442,0,,-0.02,-0.03,0.95,0.2,-6.0,-0.3,0,,,979,26,0.0,0.0,0.0,0.0,0.0,0,0,0.0,0,0.0,-1,0.0,0.0,0.0,0
482,0,,-0.01,-0.03,0.97,0.1,-5.5,-0.2,,,,,,,,,,,,,,,,,,,,
522,0,,-0.01,-0.03,0.99,0.0,-5.0,-0.2,,,,,,,,,,,,,,,,,,,,
542,0,,,,,,,,0,,,986,26,0.0,0.0,0.0,0.0,0.0,0,0,0.0,0,0.0,-1,0.0,,0.0,0
```

## Our Project

The goal of this project is to create a comprehensive [MATLAB Toolbox](https://www.mathworks.com/help/matlab/matlab_prog/create-and-share-custom-matlab-toolboxes.html) that will include functions, an app (or two), simulations, and mathematical models for processing and visualizing the data that we get from our Baja car. This will require us to import our '.log' files, clean the file, munge through it and squeeze out all the significant bits, and then return our findings to the user in a report. The reports and summaries of the data that we collect will be kept as records for future use and reference. Once we get our reports handled to an adequate degree, we can start working on serving the information out to the user in more creative or fun ways like live graphs or other visual aids. You can read about making GUI applications with MATLAB, [here](https://www.mathworks.com/discovery/matlab-gui.html). Keep in mind that our data files will get HUGE very quickly, so we need to make sure that we use processing power and space as optimally as possible. Use MATLAB [datastore](https://www.mathworks.com/help/matlab/import_export/what-is-a-datastore.html) in order to focus on small chunks at a time without potentially bogging your computer down into oblivion. We will keep our application single threaded until we can prove that it works reliably and efficiently, only then can we think about multithreading.
