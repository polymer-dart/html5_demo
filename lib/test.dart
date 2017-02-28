import 'dart:async';
import 'package:html5/html.dart';

abstract class MyComponent extends HTMLElement {
  XMLHttpRequest req;
  MyComponent() {
    print("Hi there");
    createShadowRoot()..innerHTML = "<div> Hi!!!!!!! shadow </div>";
    onclick = (Event evt) async {
      MouseEvent mouseEvent = evt as MouseEvent;
      print("CLICKED HERE : ${mouseEvent.x},${mouseEvent.y}");

      // SAMPLE AJAX REQUEST WITH (optional) PROGRESS HANDLERS

      try {
        XMLHttpRequest req =
            await new HttpRequest(method: 'GET', url: 'index.html').send(
                progressConsumer: new StreamController<ProgressEvent>()
                  ..stream
                      .listen((event) => print('progress : ${event.loaded}')),
                uploadProgressConsumer: new StreamController<ProgressEvent>()
                  ..stream.listen(
                      (event) => print('upload progress: ${event.total}')));
        print("REQUEST STATUS : ${req.statusText}");
      } catch (error) {
        print("ERROR : ${error}");
      }
    };
  }
}

void main() {
  HTMLDivElement div = window.document.createElement('div');
  div.innerHTML = "<h1>hello</h1>";
  HTMLBodyElement body = document.querySelector('body');
  HTMLInputElement input = window.document.createElement('input');
  input
    ..type = "text"
    ..placeholder = "write something"
    ..value = "Prova";
  body.appendChild(div);
  body.appendChild(input);

  window.customElements.define('my-component', asConstructor(MyComponent));

  MyComponent comp = window.document.createElement('my-component', null);

  body.appendChild(comp);
}
