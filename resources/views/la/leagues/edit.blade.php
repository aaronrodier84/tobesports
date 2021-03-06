@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/leagues') }}">League</a> :
@endsection
@section("contentheader_description", $league->$view_col)
@section("section", "Leagues")
@section("section_url", url(config('laraadmin.adminRoute') . '/leagues'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Leagues Edit : ".$league->$view_col)

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
				{!! Form::model($league, ['route' => [config('laraadmin.adminRoute') . '.leagues.update', $league->id ], 'method'=>'PUT', 'id' => 'league-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'creator_uid')
					@la_input($module, 'slug')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/leagues') }}">Cancel</a></button>
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
	$("#league-edit-form").validate({
		
	});
});
</script>
@endpush
