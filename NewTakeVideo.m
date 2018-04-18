my_log = 'c:/tempfiles/videotest/test2.avi';
        aviobj = avifile(my_log, 'compression','Cinepak','fps',10,'quality',100);
        vid = videoinput('winvideo',1,'YUY2_640x480'); 
        set(vid, 'ReturnedColorSpace', 'rgb');
        %vid.LoggingMode = 'disk&memory';
        vid.TriggerRepeat = Inf;    
        set(vid,'FramesPerTrigger', 50);
        start(vid);
        
     
        i=0;
 
        outputFolder = fullfile(cd, 'frames');
        if ~exist(outputFolder, 'dir')
        mkdir(outputFolder);
        end;
 
        while 1
        i=i+1;
        
        img=getsnapshot(vid);
        %either use preview or image
        image(img);
        pause(0.01);
        aviobj=addframe(aviobj,img);
        img = imresize(img, (1/2));
        outputBaseFileName = sprintf('%d.png',i);
        outputFullFileName = fullfile(outputFolder, outputBaseFileName);
        imwrite(img,outputFullFileName,'jpg');
        
        
        
        
        %managing memory
        out = imaqmem;
        mem_left = out.FrameMemoryLimit - out.FrameMemoryUsed;
        half_of_memlimit=(out.FrameMemoryLimit/2);
        if mem_left < half_of_memlimit
            flushdata(vid,'triggers'); %each flushes only 50 frames
            flushdata(vid,'triggers');
        end;
 
        end;
