import 'package:flutter/material.dart';
void main() 
{
runApp(MyApp());
}

 class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      home: ShoppingListScreen(),
      debugShowCheckedModeBanner:false,
    );
  }
}

class ShoppingListScreen extends StatefulWidget 
{
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> 
{
  final List<String> _tasks=[];
  final TextEditingController _controller = TextEditingController();

  void _addTask()
  {
    if(_controller.text.isNotEmpty)
    {
      setState(() 
      {
        _tasks.add(_controller.text);
      });
      _controller.clear();
    }
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar:AppBar
      (
        title: const Text("Alışveriş Listesi",style: TextStyle(color: Colors.amberAccent),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 233, 98, 143),
      ),
      body:  Padding
      (
        padding:const EdgeInsets.all(16),
        child:Column
        (
          children: [
            TextField
            (
              decoration: const InputDecoration(labelText:"Ne Alacaksın?", border: OutlineInputBorder()),
              controller: _controller,
            ),
            const SizedBox(height: 20,),
             ElevatedButton(onPressed: _addTask, child:const Text("Ekle")),
             const SizedBox(height: 15,
             ),
             Expanded(child: ListView.builder(itemCount:_tasks.length, itemBuilder: (context,index,)
             {
              return ListTile
              (
                title: Text(_tasks[index]),
                trailing:IconButton(onPressed:()
                {
                  setState(() 
                  {
                    _tasks.removeAt(index);
                  });
                }
                , icon: const Icon(Icons.delete)) ,
              );
             })
        )],
        ),
      ), 
    );
  }
}