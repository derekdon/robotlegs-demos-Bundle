/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict
{

import flash.display.DisplayObjectContainer;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.demos.helloflashstrict.controller.CreateBallCommand;
import org.robotlegs.demos.helloflashstrict.controller.DisplayBallCommand;
import org.robotlegs.demos.helloflashstrict.controller.HelloFlashEvent;
import org.robotlegs.demos.helloflashstrict.controller.StartupCommand;
import org.robotlegs.demos.helloflashstrict.model.BallContainer;
import org.robotlegs.demos.helloflashstrict.model.IBallContainer;
import org.robotlegs.demos.helloflashstrict.view.Ball;
import org.robotlegs.demos.helloflashstrict.view.BallMediator;
import org.robotlegs.demos.helloflashstrict.view.Readout;
import org.robotlegs.demos.helloflashstrict.view.ReadoutMediator;
import org.robotlegs.mvcs.Context;


public class HelloFlashSrictContext extends Context
{
    
    public function HelloFlashSrictContext (contextView:DisplayObjectContainer)
    {
        super(contextView);
    }

    override public function startup ():void
    {
        this.commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent);
        this.commandMap.mapEvent(HelloFlashEvent.BALL_CLICKED, CreateBallCommand, HelloFlashEvent);
        this.commandMap.mapEvent(HelloFlashEvent.BALL_CREATED, DisplayBallCommand, HelloFlashEvent);
        
        this.injector.mapSingletonOf(IBallContainer, BallContainer);
        
        this.mediatorMap.mapView(Ball, BallMediator);
        this.mediatorMap.mapView(Readout, ReadoutMediator);
        
        super.startup();
    }

}
}
