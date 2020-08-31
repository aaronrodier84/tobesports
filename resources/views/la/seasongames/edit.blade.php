@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/seasongames') }}">SeasonGame</a> :
@endsection
@section("contentheader_description", $seasongame->$view_col)
@section("section", "SeasonGames")
@section("section_url", url(config('laraadmin.adminRoute') . '/seasongames'))
@section("sub_section", "Edit")

@section("htmlheader_title", "SeasonGames Edit : ".$seasongame->$view_col)

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($seasongame, ['route' => [config('laraadmin.adminRoute') . '.seasongames.update', $seasongame->id ], 'method'=>'PUT', 'id' => 'seasongame-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'season_id')
					@la_input($module, 'd_team1_id')
					@la_input($module, 'team1_id')
					@la_input($module, 'd_team2_id')
					@la_input($module, 'team2_id')
					@la_input($module, 'start_ts')
					@la_input($module, 'score1')
					@la_input($module, 'score2')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/seasongames') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#seasongame-edit-form").validate({
		
	});
});
</script>
@endpush
