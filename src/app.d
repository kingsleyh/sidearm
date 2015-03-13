import std.stdio;

import std.conv;
import std.array;
import dsfml.graphics;

class Editor {

public void go(){
  ContextSettings settings;
settings.antialiasingLevel = 5;

 auto window = new RenderWindow(VideoMode(1200,700),"SideArm", Window.Style.DefaultStyle);
  window.setFramerateLimit(60);

       auto font = new Font();
    if(!font.loadFromFile("resources/arial.ttf"))
        return;

dchar[] content = [];


while (window.isOpen())
    {
        Event event;

        while(window.pollEvent(event))
        {
            if(event.type == event.EventType.Closed)
            {
                window.close();
            }

           if(event.type == event.EventType.TextEntered){

                if(Keyboard.isKeyPressed(Keyboard.Key.BackSpace)){
                  if(content.length > 0){
                  content.popBack();
                  }
               } else {
                content ~= event.text.unicode;
               }
           }

           if(Keyboard.isKeyPressed(Keyboard.Key.Return)){
                    writeln("enter was pressed");
                    content ~= "\n";
                  }

        }


window.clear();

auto words = new Text(to!dstring(content), font, 20);
    words.position = Vector2f(10,10);
window.draw(words);

window.display();



}

}
}

void main()
{

new Editor().go();

}
