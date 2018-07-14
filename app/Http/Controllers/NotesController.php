<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Note;
use App\Http\Requests\CreateCustomerRequest;

class NotesController extends Controller {

 

    public function all() {
        $customers = Note::latest()->paginate(10);

        return response()->json([
                    "notes" => $customers
                        ], 200);
    }

    public function get($id) {
        $customer = Note::whereId($id)->first();

        return response()->json([
                    "note" => $customer
                        ], 200);
    }

    public function store(Request $request) {
        $customer = Note::create($request->only(["user_id", "title", "content","tags"]));

        return response()->json([
                    "note" => $customer
                        ], 200);
    }

  //  public function update(CreateCustomerRequest $request, $id) {
    public function update(Request $request, $id) {
        $edit = Note::find($id)->update($request->all());
        return response()->json($edit);
    }

    public function destroy($id) {
        Note::find($id)->delete();
        return response()->json([
                    "success" => 'done'
                        ], 200);
    }

}
