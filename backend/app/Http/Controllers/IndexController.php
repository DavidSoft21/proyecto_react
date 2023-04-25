<?php

namespace App\Http\Controllers;

use App\Models\Index;
use App\Models\Empresa;
use App\Models\TypeIndex;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;



class IndexController extends Controller
{

    public function consecutive_generate($consecutive, $type_index_id)
    {

        switch ($type_index_id) {

            case 1:
                $consecutive = $consecutive + 1;
                return $consecutive;
                break;
            case 2:
                $consecutive = trim($consecutive);
                $vector_consecutive = explode(".", $consecutive);

                if (count($vector_consecutive) == 1) {
                    $consecutive = $consecutive . "." . 1;
                } else {
                    $consecutive = $vector_consecutive[0] . "." . intval($vector_consecutive[1]) + 1;
                }
                return $consecutive;
                break;
            case 3:
                $consecutive = trim($consecutive);
                $vector_consecutive = explode(".", $consecutive);

                if (count($vector_consecutive) == 3) {

                    if (array_key_exists(2, $vector_consecutive) == false) {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . +1;
                        return $consecutive;
                    } else {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . intval($vector_consecutive[2]) + 1;
                        return $consecutive;
                    }
                }
                break;
            case 4:
                $consecutive = trim($consecutive);
                $vector_consecutive = explode(".", $consecutive);
                if (count($vector_consecutive) == 4) {
                    if (array_key_exists(3, $vector_consecutive) == false) {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . "." + 1;
                        return $consecutive;
                    } else {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . "." . intval($vector_consecutive[3]) + 1;
                        return $consecutive;
                    }
                }
                break;
            case 5:
                $consecutive = trim($consecutive);
                $vector_consecutive = explode(".", $consecutive);
                if (count($vector_consecutive) == 5) {
                    if (array_key_exists(4, $vector_consecutive) == false) {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . $vector_consecutive[3] . "." + 1;
                        return $consecutive;
                    } else {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . $vector_consecutive[3] . "." . intval($vector_consecutive[4]) + 1;
                        return $consecutive;
                    }
                }
                break;

            case 6:
                $consecutive = trim($consecutive);
                $vector_consecutive = explode(".", $consecutive);
                if (count($vector_consecutive) == 6) {
                    if (array_key_exists(5, $vector_consecutive) == false) {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . $vector_consecutive[3] . "." . $vector_consecutive[4] . "." + 1;
                        return $consecutive;
                    } else {
                        $consecutive = $vector_consecutive[0] . "." . $vector_consecutive[1] . "." . $vector_consecutive[2] . $vector_consecutive[3] . "." . $vector_consecutive[4] . "." . intval($vector_consecutive[5]) + 1;
                        return $consecutive;
                    }
                }
                break;
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $date = Carbon::now()->toString();
        $yearCurrent = substr($date, 11, 4);
        $index  = Index::join('empresa', 'index.empresa_id', '=', 'empresa.id')
            ->select('*')
            ->where('index.created_at', 'like', "{$yearCurrent}%")
            ->orderBy('consecutive', 'ASC')
            ->orderBy('empresa_id', 'ASC')
            ->get();
        return $index;
    }

    public function indexByYear(Request $request)
    {
        $index = Index::join('empresa', 'index.empresa_id', '=', 'empresa.id')
            ->select('*')
            ->where('index.created_at', 'like', "{$request->year}%")
            ->orderBy('consecutive', 'ASC')
            ->orderBy('empresa_id', 'ASC')
            ->get();
        return $index;
    }

    public function indexByCompany(Request $request)
    {
    
       
        $index = Index::join('empresa', 'index.empresa_id', '=', 'empresa.id')
            ->select('*')
            ->where('index.empresa_id', '=', "{$request->id}%")
            ->where('index.year', 'like', "{$request->year}")
            ->orderBy('consecutive', 'ASC')
            ->orderBy('empresa_id', 'ASC')
            ->get();
        return $index;
    }

    /**
     * Store a newly created resource in storage.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $type_index = TypeIndex::where('name', $request->type_index)->get();
        $type_index_name = $type_index[0]->name;
        $type_index_id = $type_index[0]->id;

        if ($type_index_name == 'primary') {

            $records = DB::table('index')
                ->select('*')
                ->first();

            if (isset($records) == false) {

                $index = new Index();

                $index->year = $request->year;
                $index->title = $request->title;
                $index->consecutive = $this->consecutive_generate(0, 1);
                $index->user_id = $request->user_id;
                $index->type_index_id = 1;
                $index->state_id = 1;
                $index->parent_index_id = $request->parent_index_id;
                $index->prev_consecutive = 0;
                $index->next_consecutive = 2;
                $index->save();

                return $index;
            } else {

                $last_reg = DB::table('index')
                    ->select('*')
                    ->where('type_index_id', 1)
                    ->orderBy('consecutive', 'DESC')
                    ->get()
                    ->first();

                $last_consecutive = $last_reg->consecutive;
                $consecutive_generate =  $this->consecutive_generate($last_consecutive, $type_index_id);

                $index = new Index();
                $index->year = $request->year;
                $index->title = $request->title;
                $index->consecutive = $consecutive_generate;
                $index->user_id = $request->user_id;
                $index->type_index_id = $request->type_index_id;
                $index->state_id = 1;
                $index->parent_index_id = $request->parent_index_id;
                $index->prev_consecutive = $last_consecutive;
                $index->next_consecutive = $this->consecutive_generate($consecutive_generate, $type_index_id);
                $index->save();
                return $index;
            }
        } else {

            $records = DB::table('index')
                ->select('*')
                ->first();

            if (isset($records) == false) {
                return response()->json([
                    'code' => '400',
                    'message' => 'you cannot create such an indece without an ancestor.'
                ]);
            } else {

                $parent_reg = DB::table('index')
                    ->select('*')
                    ->where('id', $request->parent_index_id)
                    ->first();

                if (empty($parent_reg) === true) {

                    return response()->json([
                        'code' => '400',
                        'message' => 'could not find parent record.'
                    ]);
                } else {

                    $parent_type_index_id = $parent_reg->type_index_id;
                    $sub_index = $parent_type_index_id + 1;

                    $last_reg_consecutive = DB::table('index')
                        ->select('*')
                        ->where(
                            [
                                ['type_index_id', "=", $sub_index],
                                ['parent_index_id', "=", $request->parent_index_id]
                            ]
                        )
                        ->orderBy('consecutive', 'DESC')
                        ->get()
                        ->first();

                    if (is_null($last_reg_consecutive?->id) == true) {

                        $data = explode(".", $parent_reg->consecutive);

                        $first_consecutive = null;

                        for ($i = 0; $i <= count($data); $i++) {

                            if (count($data) == $i) {
                                $first_consecutive = $first_consecutive . "1";
                            } else {
                                $first_consecutive = $first_consecutive . $data[$i] . ".";
                            }
                        }

                        $index = new Index();
                        $index->year = $request->year;
                        $index->title = $request->title;
                        $index->consecutive = $first_consecutive;
                        $index->user_id = $request->user_id;
                        $index->type_index_id = $sub_index;
                        $index->state_id = 1;
                        $index->parent_index_id = $request->parent_index_id;
                        $index->prev_consecutive = $parent_reg->consecutive;
                        $index->next_consecutive = $this->consecutive_generate($first_consecutive, $sub_index);
                        $index->save();

                        return $index;
                    } else {

                        $parent_type_index_id = $parent_reg->type_index_id;
                        $sub_index = $parent_type_index_id + 1;

                        $last_reg_consecutive = DB::table('index')
                            ->select('*')
                            ->where(
                                [
                                    ['type_index_id', "=", $sub_index],
                                    ['parent_index_id', "=", $request->parent_index_id]
                                ]
                            )
                            ->orderBy('consecutive', 'DESC')
                            ->get()
                            ->first();

                        if (is_null($last_reg_consecutive?->id) == false) {

                            $index = new Index();
                            $index->year = $request->year;
                            $index->title = $request->title;
                            $index->consecutive = $this->consecutive_generate($last_reg_consecutive->consecutive, $sub_index);
                            $index->user_id = $request->user_id;
                            $index->type_index_id = $sub_index;
                            $index->state_id = 1;
                            $index->parent_index_id = $request->parent_index_id;
                            $index->prev_consecutive = $last_reg_consecutive->consecutive;
                            $index->next_consecutive = $this->consecutive_generate($index->consecutive, $sub_index);
                            $index->save();
                            return $index;
                        }
                    }
                }
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Index  $index
     * @return \Illuminate\Http\Response
     */
    public function show(Index $index)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Index  $index
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Index $index)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Index  $index
     * @return \Illuminate\Http\Response
     */
    public function destroy(Index $index)
    {
        //
    }
}
